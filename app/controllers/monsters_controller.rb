class MonstersController < ApplicationController
  UPDATE_PARAMS = [:team_id, :monster_type_id, :monster_name, :monster_power]
  CREATE_PARAMS = UPDATE_PARAMS

  load_and_authorize_resource

  respond_to :html, :json

  def index
    @monsters = current_user.monsters
    respond_with(@monsters)
  end

  def show
    respond_with(@monster)
  end

  def new
    respond_with(@monster)
  end

  def edit
  end

  def create
    @monster.user = current_user
    flash[:notice] = 'Monster was successfully created.' if @monster.save
    respond_with(@monster)
  end

  def update
    flash[:notice] = 'Monster was successfully updated.' if @monster.update(update_params)
    respond_with(@monster)
  end

  def destroy
    @monster.destroy
    respond_with(@monster)
  end

  private

  def create_params
    params.require(:monster).permit(CREATE_PARAMS)
  end

  def update_params
    params.require(:monster).permit(UPDATE_PARAMS)
  end
end
