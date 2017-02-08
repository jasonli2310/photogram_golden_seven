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

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row

    @newcaption = params["the_caption"]
    @newsource = params["the_source"]

    a = Photo.new
    a.source = @newsource
    a.caption = @newcaption
    a.save

    redirect_to("http://localhost:3000/photos")
  end

  def destroy
    @photo_id = params["id"].to_i

    link = Photo.find(@photo_id)
    link.delete

    redirect_to("http://localhost:3000/photos")

  end
end
