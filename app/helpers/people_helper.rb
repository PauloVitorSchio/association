module PeopleHelper
    def active_class_for_person(person)
        person.active? ? 'success' : 'danger'
    end

    def icon_for_person(person)
        person.active? ? 'check-circle' : 'x-circle'
    end
end
