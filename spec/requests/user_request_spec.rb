require 'rails_helper'

RSpec.describe User, type: :request do
  before do
    @user = User.create(name: 'Abel Tsegaye', photo: 'link to photo', bio: 'Make a diffrence', posts_counter: 0)
  end
  describe ' user#index' do
    it 'should render the users index' do
      get users_path
      expect(response.status).to eq(200)
      expect(response).to render_template('users/index')
      expect(response.body).to include 'Number of posts'
    end

    it 'should render the users show' do
      get user_path(@user.id)
      expect(response.status).to eq(200)
      expect(response).to render_template('users/show')
      expect(response.body).to include 'Number of posts:'
    end
  end
end
