module ApplicationHelper

	# <li class="nav-item">
	#          <%= link_to_unless_current("Courses", courses_path, {class: "nav-link"}) do %>
	#              <span class="nav-link active">Courses</span>
	#          <% end %>
	#    </li>
 	def nav_menu_item(name, path)
 		content_tag(:li, class: "nav-item") do 
 			link_to_unless_current(name, path, {class: "nav-link"}) do
 				content_tag(:span, name, {class: "nav-link active"})
 			end
 		end
 	end

end
