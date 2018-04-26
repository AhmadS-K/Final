class CreateBirthdays < ActiveRecord::Migration[5.1]
  def change
    create_table :birthdays do |t|
      t.string :fname
      t.string :lname
      t.date :date

      t.timestamps
    end
  end
end
