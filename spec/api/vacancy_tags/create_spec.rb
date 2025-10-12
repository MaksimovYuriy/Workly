require 'rails_helper'

RSpec.describe "vacancy_tags#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/vacancy_tags", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'vacancy_tags',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(VacancyTagResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { VacancyTag.count }.by(1)
    end
  end
end
