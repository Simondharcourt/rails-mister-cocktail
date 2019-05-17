class CocktailsController < ApplicationController
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    find_it
  end

  def update
    if @cocktail.update(params_cocktail)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def delete
    find_it
    @cocktail.destroy
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    find_it
    # raise
    # find_the_doses
  end

private

  def find_it
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end

  # def find_the_doses
    # @all_doses = Doses.all
  #   @doses = Dose.find(params[:id])
  # end
end
