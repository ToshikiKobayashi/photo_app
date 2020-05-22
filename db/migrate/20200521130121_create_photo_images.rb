class CreatePhotoImages < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_images do |t|
      t.text :filename
      t.text :title
      t.timestamps
    end
  end
end
