jQuery(function(e){setTimeout(function(){e("#registration_registerable_type_group").ready(function(){e("#registerable_group").parent().hide(),e("#registration_registerable_type_group").change(function(){e("#registerable_student").parent().hide(),e("#registerable_group").parent().show()})}),e("#registration_registerable_type_student").ready(function(){e("#registration_registerable_type_student").prop("checked",!0),e("#registration_registerable_type_student").change(function(){e("#registerable_student").parent().show(),e("#registerable_group").parent().hide()})})},1e3)});