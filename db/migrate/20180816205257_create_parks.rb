class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :api_id
      t.text :description
      t.string :designation
      t.string :full_name
      t.string :coordinates, array: true, default: []
      t.string :url
      t.string :weather_info
      t.string :image_titles, array: true, default: []
      t.string :image_sources, array: true, default: []

      t.timestamps
    end
  end
end
