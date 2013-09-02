class AddColumnSumtoUsers < ActiveRecord::Migration
  def change
    add_column :users, :sum_karma, :integer
  end
end
