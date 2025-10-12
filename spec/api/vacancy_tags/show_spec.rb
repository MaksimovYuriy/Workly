require 'rails_helper'

RSpec.describe "vacancy_tags#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/vacancy_tags/#{vacancy_tag.id}", params: params
  end

  describe 'basic fetch' do
    let!(:vacancy_tag) { create(:vacancy_tag) }

    it 'works' do
      expect(VacancyTagResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('vacancy_tags')
      expect(d.id).to eq(vacancy_tag.id)
    end
  end
end
