require 'rails_helper'
require 'nokogiri'
require 'faker'

RSpec.describe "Tasks", type: :request do
  describe 'paths' do
    context '/input' do
      it 'should return http success' do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context '/show' do 
      it 'should return http success' do
        get task_show_path, params: { array: "24 6 496 1 6 8128 -7" }
        expect(response).to have_http_status(:success)
      end

      it 'should return http error without params' do
        get task_show_path
        expect(response).to have_http_status(302)
      end   

      it 'should return http error with bad params' do
        get task_show_path, params: { array: Faker::Lorem.sentence }
        expect(response).to have_http_status(302)
      end
    end
  end
end
