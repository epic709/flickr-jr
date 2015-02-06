class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |x|
      x.belongs_to :album
      x.string :avatar
      x.timestamps null: false
    end
  end
end
