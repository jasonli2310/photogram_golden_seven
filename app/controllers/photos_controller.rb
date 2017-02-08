class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all

    render("photos/index.html.erb")
  end

  def show
    @photo_id = params["id"].to_i

    @photolink = Photo.find(@photo_id)

    @display = @photolink["source"]
    @caption = @photolink["caption"]

    render("photos/show.html.erb")
  end


end
