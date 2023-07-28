require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/post/{post_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    get('list comments') do
      response(200, 'successful') do
        let(:post_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end