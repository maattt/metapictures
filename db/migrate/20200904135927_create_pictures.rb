class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :model
      t.datetime :shooting_date
      t.string :exposure_time
      t.string :f_number
      t.string :focal_length
      t.string :gps_latitude
      t.string :gps_longitude
      t.timestamps
    end
  end
end
