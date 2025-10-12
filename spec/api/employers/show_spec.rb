require 'rails_helper'

RSpec.describe "employers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/employers/#{employer.id}", params: params
  end

  describe 'basic fetch' do
    let!(:employer) { create(:employer) }

    it 'works' do
      expect(EmployerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('employers')
      expect(d.id).to eq(employer.id)
    end
  end
end
