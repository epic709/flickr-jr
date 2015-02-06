class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |x|
      x.string :username
      x.string :password
      x.timestamps null: false
    end
  end
end
