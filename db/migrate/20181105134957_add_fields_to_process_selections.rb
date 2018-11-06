class AddFieldsToProcessSelections < ActiveRecord::Migration[5.1]
  def change
    change_table :process_selections do |t|
      t.integer    :min_time_function
      t.integer    :min_time_title
      t.integer    :min_anual_salary
      t.integer    :max_anual_salary
      t.references :area
      t.references :function
      t.references :title_list
      t.references :education_list
      t.references :language_list
    end
  end
end
