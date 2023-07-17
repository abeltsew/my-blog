require 'rails_helper'

RSpec.describe User, type: :request do
  describe ' user#index' do
    it 'should render the users index' do
      get users_path
      expect(response.status).to eq(200)
      expect(response).to render_template('users/index')
      expect(response.body).to include 'Number of posts'
    end

    it 'should render the users show' do
      get '/users/:id'
      expect(response.status).to eq(200)
      expect(response).to render_template('users/show')
      expect(response.body).to include 'Number of posts:'
    end
  end
end
