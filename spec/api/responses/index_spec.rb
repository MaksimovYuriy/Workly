require 'rails_helper'

RSpec.describe "responses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/responses", params: params
  end

  describe 'basic fetch' do
    let!(:response1) { create(:response) }
    let!(:response2) { create(:response) }

    it 'works' do
      expect(ResponseResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['responses'])
      expect(d.map(&:id)).to match_array([response1.id, response2.id])
    end
  end
end
