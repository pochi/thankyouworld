class CreateOauths < ActiveRecord::Migration
  def self.up
    create_table :oauths do |t|
      t.string :access_token, :null => false
      t.string :access_token_secret, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :oauths
  end
end
