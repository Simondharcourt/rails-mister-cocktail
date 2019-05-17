class DosesController < ApplicationController
  before_action :find_it, only: [:new, :create]

  def new
    find_it
    @dose = Dose.new
  end

  def create
    find_it
    @dose = Dose.new(params_doses)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

private

  def find_it
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def params_doses
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
