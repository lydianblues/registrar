json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@groups) do |group|

		json.name raw render(template: 'groups/_name.html.erb',
			locals: {name: group.name, id: group.group_id })

		json.owner raw render(template: 'groups/_owner.html.erb',
			locals: {owner: group.owner, id: group.owner_id })

		if group.organization_id.blank?
			json.organization ""
		else
			json.organization raw render(template: 'groups/_organization.html.erb',
				locals: {organization: group.organization, id: group.organization_id })
		end

		json.extract! group, :count

		json.edit_button raw render(template: 'groups/_edit_button.html.erb',
			locals: {id: group.group_id})
	
		json.delete_button raw render(template: 'groups/_delete_button.html.erb',
			locals: {id: group.group_id})
	end
end
