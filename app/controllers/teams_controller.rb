class TeamsController < ApplicationController
  UPDATE_PARAMS = [:team_name]
  CREATE_PARAMS = UPDATE_PARAMS

  load_and_authorize_resource

  respond_to :html, :json

  def index
    @teams = current_user.teams
    respond_with(@teams)
  end

  def show
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team.user = current_user
    flash[:notice] = 'Team was successfully created.' if @team.save
    respond_with(@team)
  end

  def update
    flash[:notice] = 'Team was successfully updated.' if @team.update(update_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  private

  def create_params
    params.require(:team).permit(CREATE_PARAMS)
  end

  def update_params
    params.require(:team).permit(UPDATE_PARAMS)
  end
end
