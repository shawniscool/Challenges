class AddDetailsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :endDate, :date
    add_column :challenges, :money, :float
  end
end
