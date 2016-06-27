module DataTables
	module Query

		def gen_sql(params)

			draw = params[:draw]
			start = params[:start]
			length = params[:length]
			columns = params[:columns]
			order = params[:order]
			search = params[:search]

			table = arel_table 
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
			add_search_to_query(params, query)

			restrict_students_to_group(query, params[:gid])

			query.to_sql
		end

		def count_search_results(params)
			table = arel_table	
			query = table.project("count(*)") 
			add_search_to_query(params, query)
			restrict_students_to_group(query, params[:gid])
			query.to_sql
		end

		def get_group_size(params)
			table = arel_table	
			query = table.project("count(*)") 
			restrict_students_to_group(query, params[:gid])
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

		def restrict_students_to_group(query, group_id)
			unless group_id.blank?
				if (self.name == 'Student')
					table = arel_table
					groups_students =  Arel::Table.new(:groups_students)
					query.join(groups_students).on(table[:id].
						eq(groups_students[:student_id]))
							.where(groups_students[:group_id].eq(Arel::Nodes::Quoted.new(group_id)))
				end
			end
		end

		def add_search_to_query(params, query)
			search = params[:search]
			columns = params[:columns]
			table = arel_table

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
					predicate = table[searchable.shift].matches(search_val)
					searchable.each do |col|
						predicate = predicate.or(table[col].matches(search_val))
					end
					query.where(predicate)
				end
			end
			query
		end
	end
end