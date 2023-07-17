require 'rails_helper'

RSpec.describe Post, type: :request do
    describe '#post' do
        it 'should render the post index' do
            get '/users/1/posts'
            expect(response.status).to eq(200)
            expect(response).to render_template('posts/index')
            expect(response.body).to include 'Pagination'
        end

        it 'should render the post show' do
            get '/users/1/posts/1'
            expect(response.status).to eq(200)
            expect(response).to render_template('posts/show')
            expect(response.body).to include 'Post #1 by Username'
        end

    end

end