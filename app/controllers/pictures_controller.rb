require 'exifr/jpeg'

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # POST /pictures
  # POST /pictures.json
  def create
    params[:files].each do |file|
      picture = Picture.new(file: file)
      if picture.save
        exifs = EXIFR::JPEG.new(picture.file_path)
        picture.update(model: exifs.model, shooting_date: exifs.date_time, exposure_time: exifs.exposure_time, f_number: exifs.f_number, focal_length: exifs.focal_length, gps_longitude: (exifs.gps ? exifs.gps.longitude : nil), gps_latitude: (exifs.gps ? exifs.gps.gps_latitude : nil))
      end
    end
    redirect_to pictures_path
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end
end
