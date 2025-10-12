require 'rails_helper'

RSpec.describe "vacancy_tags#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/vacancy_tags/#{vacancy_tag.id}"
  end

  describe 'basic destroy' do
    let!(:vacancy_tag) { create(:vacancy_tag) }

    it 'updates the resource' do
      expect(VacancyTagResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { VacancyTag.count }.by(-1)
      expect { vacancy_tag.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
