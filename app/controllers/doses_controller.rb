class DosesController < ApplicationController
  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.where(cocktail: @cocktail)
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktails_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:cocktail_id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :cocktail_id, :description)

  end
end
