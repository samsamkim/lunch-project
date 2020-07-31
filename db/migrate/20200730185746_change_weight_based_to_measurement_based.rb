class ChangeWeightBasedToMeasurementBased < ActiveRecord::Migration[6.0]
  def change
    rename_sti_type :courses, 'WeightBased', 'MeasurementBased'
  end

  def rename_sti_type(table_name, old_type, new_type)
    reversible do |dir|
      dir.up { execute "UPDATE #{table_name} SET type = '#{new_type}' WHERE type = '#{old_type}'" }
      dir.down { execute "UPDATE #{table_name} SET type = '#{old_type}' WHERE type = '#{new_type}'"}
    end
  end
  
end
