require 'rails_helper'

RSpec.describe MonstersController, type: :controller do
  let!(:user) { create :user }
  let!(:user2) { create :user }
  let!(:t1) { create :team, user: user }
  let!(:t2) { create :team, user: user2 }

  before :each do
    Rails.application.load_seed
    request.env['HTTP_ACCEPT'] = 'application/json'
    sign_in user
  end

  let!(:m1) { create :monster, user: user, team: t1, monster_type: MonsterType.first }
  let!(:m2) { create :monster, user: user2, team: t2, monster_type: MonsterType.first }

  it 'GET index' do
    get :index
    expect(response).to be_ok
    expect(assigns(:monsters)).to contain_exactly(m1)
  end

  it 'GET show' do
    get :show, { id: m1.to_param }
    expect(response).to be_ok
    expect(assigns(:monster)).to eq m1
  end

  it 'POST create' do
    a1 = attributes_for :monster, monster_type_id: MonsterType.first

    post :create, { monster: a1 }
    m3 = assigns(:monster)

    expect(m3).to be_a Monster
    expect(m3).to be_persisted
  end

  it 'PUT update' do
    a1 = attributes_for :monster

    put :update, { id: m1.to_param, monster: a1 }
    expect(response).to be_success
    m1.reload

    expect(assigns(:monster)).to eq m1
    expect(m1.monster_name).to eq a1[:monster_name]
  end

  it 'DELETE destroy' do
    expect {
      delete :destroy, { id: m1.to_param }
    }.to change(user.monsters, :count).by(-1)
  end
end
