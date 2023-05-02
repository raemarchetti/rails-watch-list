class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  # needs_view - get
  def index
    @lists = List.all
  end

  # no view needed - post
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # needs view - get
  def new
    @list = List.new
  end

  # needs view - get
  def show; end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
