class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @bookmarks = @tag.bookmarks.where(user_id: current_user)


  end
end
