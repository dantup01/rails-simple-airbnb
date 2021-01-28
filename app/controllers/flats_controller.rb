class FlatsController < ApplicationController
  before_action :flat_params, only: [:show, :edit, :update, :destroy]
  def index
    @flats = Flat.all
  end

  def show; end

  def edit; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save

    redirect_to flat_path(@flat)
  end

  def update
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy

    redirect_to flats.path
  end

  private

  def set_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def flat_params
    @flat = Flat.find(params[:id])
  end
end
