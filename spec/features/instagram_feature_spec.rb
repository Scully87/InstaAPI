require 'spec_helper'

feature 'Instgram' do
  context 'Connecting' do

    scenario 'should display a link to connect to instagram' do
      visit '/'
      expect(page).to have_link 'Connect with Instagram'
    end
  end
end