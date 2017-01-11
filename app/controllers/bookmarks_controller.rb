class BookmarksController < ApplicationController
  before_action :authenticate_user
  # helper_method :get_thumbnail_url

  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render 'new'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to bookmark_path(@bookmark)
    else
      render 'edit'
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @object = LinkThumbnailer.generate(@bookmark.url)
    @image = @object.images.first.src.to_s
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :user_id, :all_tags, :title, :notes, :description)
  end

  # def get_thumbnail_url(url)
  #   object = LinkThumbnailer.generate(url)
  #   object.images.first.src.to_s
  # end
end
