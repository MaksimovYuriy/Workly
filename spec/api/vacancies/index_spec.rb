require 'rails_helper'

RSpec.describe "vacancies#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/vacancies", params: params
  end

  describe 'basic fetch' do
    let!(:vacancy1) { create(:vacancy) }
    let!(:vacancy2) { create(:vacancy) }

    it 'works' do
      expect(VacancyResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['vacancies'])
      expect(d.map(&:id)).to match_array([vacancy1.id, vacancy2.id])
    end
  end
end
