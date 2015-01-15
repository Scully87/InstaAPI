require 'spec_helper'

  describe 'Instgram' do
    it 'should validate types' do
      get 'http://example.com/api/v1/simple_get' #json api that returns { "name" : "John Doe" }
      expect_json_types({name: :string})
    end
  end