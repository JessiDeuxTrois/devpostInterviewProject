class CompetitionsController < ApplicationController
  respond_to :html, :json

  def index
    @competitions = Competition.order("created_at DESC")
    @prizes = Prize.where(competition_id: @competitions.ids)
    respond_to do |format|
      format.html  # index.html.erb
      format.js   { render 'index.js.erb', status: :ok, layout: false }
    end
  end

  def create
    # running into issues here with the prize not attaching to correct competition
    @competition_new = Competition.create!(
                      user_id: current_user.id,
                      name: params[:competition][:name]
                    )
    if @competition_new.save
      @prizes = Prize.create!(
                  competition_id: @competition_new.id,
                  name: params[:competition][:prize_name],
                  dollar_value: params[:competition][:prize_value]
                )
      if @prizes.save
        # this section also allowed for json responses if necessary
        respond_to do |format|
        # this notice would have been styled as a prompt for the user
        format.html { redirect_to competitions_path, notice: "Competition created" }
      end
    end   
    else
      # this would have flashed an error on the screen for the user to see
      flash["error"] = "error"
    end
  end

  def new 
    @competitions = Competition.new
  end

  def update
    # did not have enough time to do update, however, I would search for the competition record based on the given id and update the fields where necessary
  end

  private    

  def competition_params
    # wanted to include a require here for the competition wrapper, but was having issues when trying to use the new.html.erb, so made it optional
    params.permit(:name, :authenticity_token, :competition, :commit, :prize_name, :prize_value)
  end
end
