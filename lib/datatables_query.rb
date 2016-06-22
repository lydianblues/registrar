module DataTables
	module Query

		def gen_sql(table_sym, params)

			draw = params[:draw]
			start = params[:start]
			length = params[:length]
			columns = params[:columns]
			order = params[:order]
			search = params[:search]

			table = Arel::Table.new(table_sym)
			query = table.project(Arel.star)

			# Handle "start" and "length"
			query.take(length.to_i).skip(start.to_i)

			# Handle ordering.
			order_index = order['0'][:column]
			order_col = columns[order_index][:data].to_sym
			order_dir = order['0'][:dir].to_sym
			if (order_col == :full_name)
				query.order(table[:wp_last_name].send(order_dir),
					table[:wp_first_name].send(order_dir))
			else
				query.order(table[order_col].send(order_dir))
			end

			# Handle searching.
			query = add_search_to_query(table, params, query)

			query.to_sql
		end

		def count_search_results(table_sym, params)
			table = Arel::Table.new(table_sym)	
			query = table.project("count(*)") 
			query = add_search_to_query(table, params, query)
			query.to_sql
		end

		private

		# Create an array of symbols for the searchable columns
		def extract_searchable(columns)
			searchable = []	
			columns.each do |key, val|
				name = val[:data].to_sym
				if val[:searchable] == "true"
					searchable << name
				end
			end
			searchable
		end

		def add_search_to_query(table, params, query)
			search = params[:search]
			columns = params[:columns]

			searchable = extract_searchable(columns)

			#
			# A hack to handle the full_name column.  It is a pseudo-column
			# not present in the database.
			#
			if searchable.include? :full_name
				searchable.delete :full_name
				searchable << :wp_first_name
				searchable << :wp_last_name
			end

			unless search["value"].blank?
				search_val = '%' + sanitize_sql(search["value"]) + '%'

				unless searchable.empty?
					select = table[searchable.shift].matches(search_val)
					searchable.each do |col|
						select = select.or(table[col].matches(search_val))
					end
					query.where(select)
				end
			end
			query
		end
	end
end