class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :make
      t.string :model
      t.string :lens_make
      t.string :lens_model
      t.datetime :shooting_date
      t.string :exposure_time
      t.string :f_number
      t.string :focal_length
      t.string :iso_speed_ratings
      t.string :gps_latitude
      t.string :gps_longitude
      t.timestamps
    end
  end
end
