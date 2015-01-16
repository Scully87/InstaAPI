require 'spec_helper'

feature 'Instgram' do
  context 'Connecting' do

    scenario 'should display a link to connect to instagram' do
      visit '/'
      expect(page).to have_link 'Connect with Instagram'
    end

    scenario 'should take user to authorise page' do
      visit '/'
      click_link 'Connect with Instagram'
      expect(current_path).to eq '/oauth/authorize/'
    end

    scenario 'once authorised user should see page of functions' do
      visit '/nav'
      expect(page).to have_content 'INSTA STUFF'
    end
  end

  it 'should validate types' do
    get 'https://api.instagram.com/v1/users', {'client_id' => "ENV['INSTA_CLIENT_ID']"} 
    expect_json_types({user: :string})
  end

  context 'Nav Functions' do

    xscenario 'should see users recent media' do
      visit '/nav'
      click_link 'Click To See Recent Media'
      expect(current_path).to eq '/user_recent_media'
      expect(page).to have_content "#{@user.username}'s recent Photos"
    end
  end


end