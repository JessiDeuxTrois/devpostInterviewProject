class PrizeController < ApplicationController
  def create
    @prizes = Prize.new(prizes_params)
    if @prizes.save
      respond_to do |format|
      format.html { redirect_to competitions_path, notice: "Prize created" }
    end   
    else
      render json: { errors: @prizes.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private    

  def prizes_params
    params.permit(:competition_id, :name, :dollar_value)
  end

end
