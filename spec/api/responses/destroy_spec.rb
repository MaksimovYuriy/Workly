require 'rails_helper'

RSpec.describe "responses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/responses/#{response.id}"
  end

  describe 'basic destroy' do
    let!(:response) { create(:response) }

    it 'updates the resource' do
      expect(ResponseResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Response.count }.by(-1)
      expect { response.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
