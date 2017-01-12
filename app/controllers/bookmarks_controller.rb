class BookmarksController < ApplicationController
  before_action :authenticate_user
  before_action :set_bookmark, only: [:edit, :update, :show, :destroy]

  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    @bookmark = Bookmark.new
  end

  def generate_suggested_tags
    unless params[:bookmark][:url].blank?
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.suggested_tags = TagSuggester.new(@bookmark.url)
      @object = LinkThumbnailer.generate(@bookmark.url)
      @bookmark.title = @object.title
      @bookmark.description = @object.description
      !@object.images.blank? ? @bookmark.image_url = @object.images.first.src.to_s : @bookmark.image_url = ""
    else
      redirect_to new_bookmark_path
    end
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
    # @bookmark = Bookmark.find(params[:id])
  end

  def update
    # @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to bookmark_path(@bookmark)
    else
      render 'edit'
    end
  end

  def show
    #@bookmark = Bookmark.find(params[:id])
    @bookmark = Bookmark.where(id: params[:id]).where(user_id: current_user.id).first
    #binding.pry
  end

  def destroy
    # @bookmark = Bookmark.find(params[:id])
    @bookmark_tags = BookmarkTag.where(bookmark_id: @bookmark.id)
    @bookmark_tags.each { |bookmarktag| bookmarktag.destroy }
    @bookmark.destroy
    redirect_to bookmarks_path
  end



  private
  def set_bookmark
    @bookmark = Bookmark.where(id: params[:id]).where(user_id: current_user.id).first
  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :user_id, :all_tags, :title, :notes, :description, :image_url)
  end
end
