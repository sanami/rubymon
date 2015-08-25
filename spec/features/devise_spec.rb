require 'rails_helper'

describe 'Devise', type: :feature, js: true do
  let(:user) { create :user }

  it 'login' do
    visit new_user_session_path
    page.save_screenshot 'tmp/features/login1.png'

    within 'form#new_user' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password

      find('input[name=commit]').click
    end
    page.save_screenshot 'tmp/features/login2.png'

    expect(page).to have_content 'Signed in successfully'
  end

  it 'logout' do
    login_as user
    visit root_path
    expect(page).to have_css 'body.dashboard-show'
    find('#profile-dropdown').click
    click_link 'Sign out'
    page.save_screenshot 'tmp/features/logout.png'

    expect(page).to have_content 'Signed out successfully'
  end

  it 'password reset' do
    visit new_user_password_path
    page.save_screenshot 'tmp/features/password reset.png'

    expect(page).to have_css 'body.devise-passwords-new'
  end
end
