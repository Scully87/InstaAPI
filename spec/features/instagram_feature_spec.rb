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

    scenario 'once authorised user should see list of functions' do
      visit '/nav'
      expect(page).to have_content 'INSTA STUFF'
    end
  end


end