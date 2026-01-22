class InfoController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  before_action :set_info, only: [:show, :update, :destroy]

  # GET /infos
  def index
    @infos = Info.all
    render json: @infos
  end

  # GET /infos/:id
  def show
    render json: @info
  end

  # POST /infos
  def create
    @info = Info.new(info_params)
    if @info.save
      render json: @info, status: :created
    end
  end

  # PATCH/PUT /infos/:id
  def update
    if @info.update(info_params)
      render json: @info
    end
  end

  # DELETE /infos/:id
  def destroy
    @info.destroy
  end

  private

  # Strong parameters for permitted attributes
  def info_params
    params.require(:info).permit(:name, :age, :city)
  end

  # Find the specific @info record by ID
  def set_info
    @info = Info.find(params[:id])
  end
end
