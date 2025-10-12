require 'rails_helper'

RSpec.describe "vacancies#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/vacancies", payload
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
          type: 'vacancies',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(VacancyResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Vacancy.count }.by(1)
    end
  end
end
