class AddUserIdToOauth < ActiveRecord::Migration
  def self.up
    add_column :oauths, :user_id, :integer, :null => false
  end

  def self.down
    remove_column :oauths, :user_id
  end
end
