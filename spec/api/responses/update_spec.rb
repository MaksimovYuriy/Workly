require 'rails_helper'

RSpec.describe "responses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/responses/#{response.id}", payload
  end

  describe 'basic update' do
    let!(:response) { create(:response) }

    let(:payload) do
      {
        data: {
          id: response.id.to_s,
          type: 'responses',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ResponseResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { response.reload.attributes }
    end
  end
end
