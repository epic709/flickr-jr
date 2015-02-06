class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |x|
      x.belongs_to :user
      x.string :title
      x.timestamps null: false
    end
  end
end
