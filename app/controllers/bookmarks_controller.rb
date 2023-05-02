class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # needs view - GET
  def new
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(@bookmark.list_id)
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    p params.require(:bookmark).permit(:comment, :movie_id)
  end
end
