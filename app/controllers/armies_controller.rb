class ArmiesController < ApplicationController
  include ArmiesControllerDoc
  before_action :set_army, only: %i[show update destroy train]

  # GET /armies
  def index
    @armies = Army.all

    render json: @armies
  end

  # GET /armies/1
  def show
    render json: @army
  end

  # POST /armies
  def create
    @army = army_params[:type].constantize.new

    if @army.save
      render json: @army, status: :created
    else
      render json: @army.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_army
    render status: :not_found unless (@army = Army.find_by(id: params[:id]))
  end

  # Only allow a list of trusted parameters through.
  def army_params
    params.require(:army).permit(:type)
  end
end
