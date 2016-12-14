class CreateNurses < ActiveRecord::Migration
  def change
    create_table :nurses do |t|
      t.string :name
      t.string :year_of_service
      t.string :phone

      t.timestamps
    end
  end
end
