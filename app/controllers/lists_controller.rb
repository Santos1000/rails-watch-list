class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully deleted.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def list_params
    params.require(:list).permit(:name, photos: [])
  end
end
