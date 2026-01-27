class InfoController < ApplicationController
  before_action :set_info, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @infos = Info.all
    render json: @infos
  end

  def show
    render json: @info
  end

  def create
    @info = Info.new(info_params)
    if @info.save
      render json: @info, status: :created
    end
  end
  
  def update
    if @info.update(info_params)
      render json: @info
    end
  end

  def destroy
    @info.destroy
  end

  private

  def info_params
    params.require(:info).permit(:name, :age, :city)
  end

  def set_info
    @info = Info.find(params[:id])
  end

end
