class AddCategoryToBirthday < ActiveRecord::Migration[5.1]
  def change
    add_reference :birthdays, :category, foreign_key: true
  end
end
