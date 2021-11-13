class UserController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json

  # a lot of heavy lifting is handled by devise, but still needed this to show a user landing page

  def index
    @users = User.find(params[:id])
    @competitions = Competition.where(user_id: params[:id])
    @prizes = Prize.where(competition_id: @competitions.ids)
    respond_to do |format|
      format.html  # index.html.erb
      format.js   { render 'index.js.erb', status: :ok, layout: false }
    end
  end

  def create
    @users = User.new(user_params)
    if @users.save
      respond_to do |format|
      format.html { redirect_to user_path, notice: "User created" }
    end   
    else
      render json: { errors: @users.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private    

  def user_params
    params.permit(:id, :email, :name, :role, :password)
  end
end
