class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  before_action :set_list, only: [:new, :create]


  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: 'bookmark was successfully created.'
    else
      render :new
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'bookmark was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :bookmars_url)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
