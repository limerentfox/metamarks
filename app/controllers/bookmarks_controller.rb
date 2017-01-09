class BookmarksController < ApplicationController
  before_action :authenticate_user

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
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :user_id, :all_tags)
  end
end
