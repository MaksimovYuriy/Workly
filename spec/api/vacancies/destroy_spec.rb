require 'rails_helper'

RSpec.describe "vacancies#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/vacancies/#{vacancy.id}"
  end

  describe 'basic destroy' do
    let!(:vacancy) { create(:vacancy) }

    it 'updates the resource' do
      expect(VacancyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Vacancy.count }.by(-1)
      expect { vacancy.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
