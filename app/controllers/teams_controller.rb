class TeamsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
    @teams = Team.order("created_at DESC")
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:image, :news_title, :news_text, :user_id).merge(user_id: current_user.id)
  end
end
