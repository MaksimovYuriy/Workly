require 'rails_helper'

RSpec.describe "responses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/responses/#{response.id}", params: params
  end

  describe 'basic fetch' do
    let!(:response) { create(:response) }

    it 'works' do
      expect(ResponseResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('responses')
      expect(d.id).to eq(response.id)
    end
  end
end
