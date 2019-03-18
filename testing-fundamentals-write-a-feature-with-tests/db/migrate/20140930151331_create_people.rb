class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |table|
      table.string :first_name
    end
  end
end
