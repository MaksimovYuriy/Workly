require 'rails_helper'

RSpec.describe "vacancy_tags#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/vacancy_tags", params: params
  end

  describe 'basic fetch' do
    let!(:vacancy_tag1) { create(:vacancy_tag) }
    let!(:vacancy_tag2) { create(:vacancy_tag) }

    it 'works' do
      expect(VacancyTagResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['vacancy_tags'])
      expect(d.map(&:id)).to match_array([vacancy_tag1.id, vacancy_tag2.id])
    end
  end
end
