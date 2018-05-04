module ActiveRecord
  module AutosaveAssociation
    private
    def save_has_one_association(reflection)
      association = association_instance_get(reflection.name)
      record      = association && association.load_target

      if record && !record.destroyed?
        autosave = reflection.options[:autosave]

        if autosave && record.marked_for_destruction?
          record.destroy
        elsif autosave != false
          key = reflection.options[:primary_key] ? send(reflection.options[:primary_key]) : id

          if (autosave && record.changed_for_autosave?) || new_record? || record_changed?(reflection, record, key)
            unless reflection.through_reflection
              record[reflection.foreign_key] = key
            end

            saved = record.save(validate: !autosave)
            raise ActiveRecord::Rollback if !saved && autosave
            saved
          end
        end
      end
    end

    # If the record is new or it has changed, returns true.
    def record_changed?(reflection, record, key)
      record.new_record? ||
      (record.has_attribute?(reflection.foreign_key) && record[reflection.foreign_key] != key) ||
      record.will_save_change_to_attribute?(reflection.foreign_key)
    end
  end
end