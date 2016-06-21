class Student < ApplicationRecord
	has_many :registrations, as: :registerable
	has_and_belongs_to_many :groups
	has_many :transactions

	def label
		"#{id} #{wp_first_name} #{wp_last_name}"
	end

	def handle
		wp_first_name + " " + wp_last_name
	end

	def self.gen_sql(draw, start, length, search, columns, order)

		students = Arel::Table.new(:students)
		query = students.project(Arel.star)

		# Handle "start" and "length"
		query.take(length.to_i).skip(start.to_i)

		# Handle sorting.
		sort_col_index = order["0"]["column"].to_i
		sort_col_dir = order["0"]["dir"] # a string

		if (sort_col_dir == "desc")
			if (sort_col_index == 0)
				query.order(students[:wp_last_name].desc, students[:wp_first_name].desc)
			elsif sort_col_index == 1
				query.order(students[:wp_email].desc)
			elsif sort_col_index == 2
				query.order(students[:occupation].desc)
			elsif sort_col_index == 3
				query.order(students[:organization].desc)
			end
		else
			if (sort_col_index == 0)
				query.order(students[:wp_last_name].asc, students[:wp_first_name].asc)
			elsif sort_col_index == 1
				query.order(students[:wp_email].asc)
			elsif sort_col_index == 2
				query.order(students[:occupation].asc)
			elsif sort_col_index == 3
				query.order(students[:organization].asc)
			end
		end

		# Handle searching.
		unless search["value"].blank?
			search_val = '%' + sanitize_sql(search["value"]) + '%'
			query.where(students[:wp_first_name].matches(search_val)
				.or(students[:wp_last_name].matches(search_val))
				.or(students[:wp_email].matches(search_val))
				.or(students[:occupation].matches(search_val))
				.or(students[:organization].matches(search_val)))
		end

		query.to_sql
	end


	def self.count_search_results(search_val)
		students = Arel::Table.new(:students)
		query = students.project("count(*)")
					
		search_val = '%' + sanitize_sql(search_val) + '%'
		query.where(students[:wp_first_name].matches(search_val)
			.or(students[:wp_last_name].matches(search_val))
			.or(students[:wp_email].matches(search_val))
			.or(students[:occupation].matches(search_val))
			.or(students[:organization].matches(search_val)))
		
		query.to_sql
	end

end

=begin
-- First load of the page generates this request:
{
	"draw"=>"1",
	"columns"=>{
		"0"=>{"data"=>"full_name", "name"=>"", "searchable"=>"true", "orderable"=>"true", "search"=>{"value"=>"", "regex"=>"false"}},
		"1"=>{"data"=>"wp_email", "name"=>"", "searchable"=>"true", "orderable"=>"true", "search"=>{"value"=>"", "regex"=>"false"}},
		"2"=>{"data"=>"occupation", "name"=>"", "searchable"=>"true", "orderable"=>"true", "search"=>{"value"=>"", "regex"=>"false"}},
		"3"=>{"data"=>"organization", "name"=>"", "searchable"=>"true", "orderable"=>"true", "search"=>{"value"=>"", "regex"=>"false"}},
		"4"=>{"data"=>"edit_button", "name"=>"", "searchable"=>"false", "orderable"=>"false", "search"=>{"value"=>"", "regex"=>"false"}},
		"5"=>{"data"=>"delete_button", "name"=>"", "searchable"=>"false", "orderable"=>"false", "search"=>{"value"=>"", "regex"=>"false"}}},
		"order"=>{"0"=>{"column"=>"0", "dir"=>"asc"}
	},
	"start"=>"0",
	"length"=>"10", 
	"search"=>{"value"=>"", "regex"=>"false"}, 
	"_"=>"1466457700098"
}
=end

