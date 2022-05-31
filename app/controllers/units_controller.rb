class UnitsController < ApplicationController
  include UnitsControllerDoc
  before_action :set_army
  before_action :set_unit, except: %i[index]

  # GET /units
  def index
    render json: @army.units
  end

  # GET /units/1
  def show
    render json: @unit
  end

  # POST /units/1/train
  def train
    @unit.train
    if @army.save && @unit.save
      render json: @unit
    else
      render json: @army.errors, status: :unprocessable_entity
    end
  end

  # POST /units/1/transform
  def transform
    if @unit.transform && @army.save
      render json: @unit
    else
      render json: @army.errors, status: :unprocessable_entity
    end
  end

  private

  def set_army
    render status: :not_found unless (@army = Army.find_by(id: params[:army_id]))
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_unit
    render status: :not_found unless (@unit = @army.units.find_by(id: params[:unit_id] || params[:id]))
  end
end
