require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let!(:user) { create :user }
  let!(:user2) { create :user }
  let!(:t1) { create :team, user: user }
  let!(:t2) { create :team, user: user2 }

  before :each do
    Rails.application.load_seed
    request.env['HTTP_ACCEPT'] = 'application/json'
    sign_in user
  end

  it 'GET index' do
    get :index
    expect(response).to be_ok
    expect(assigns(:teams)).to contain_exactly(t1)
  end

  it 'GET show' do
    get :show, { id: t1.to_param }
    expect(response).to be_ok
    expect(assigns(:team)).to eq t1
  end

  it 'POST create' do
    a1 = attributes_for :team

    post :create, { team: a1 }
    t3 = assigns(:team)

    expect(t3).to be_a Team
    expect(t3).to be_persisted
  end

  it 'PUT update' do
    a1 = attributes_for :team

    put :update, { id: t1.to_param, team: a1 }
    expect(response).to be_success
    t1.reload

    expect(assigns(:team)).to eq t1
    expect(t1.team_name).to eq a1[:team_name]
  end

  it 'DELETE destroy' do
    expect {
      delete :destroy, { id: t1.to_param }
    }.to change(user.teams, :count).by(-1)
  end
end
