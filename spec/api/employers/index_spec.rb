require 'rails_helper'

RSpec.describe "employers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/employers", params: params
  end

  describe 'basic fetch' do
    let!(:employer1) { create(:employer) }
    let!(:employer2) { create(:employer) }

    it 'works' do
      expect(EmployerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['employers'])
      expect(d.map(&:id)).to match_array([employer1.id, employer2.id])
    end
  end
end
