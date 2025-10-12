require 'rails_helper'

RSpec.describe "reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/reviews/#{review.id}", payload
  end

  describe 'basic update' do
    let!(:review) { create(:review) }

    let(:payload) do
      {
        data: {
          id: review.id.to_s,
          type: 'reviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { review.reload.attributes }
    end
  end
end
