require 'rails_helper'

RSpec.describe "vacancies#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/vacancies/#{vacancy.id}", payload
  end

  describe 'basic update' do
    let!(:vacancy) { create(:vacancy) }

    let(:payload) do
      {
        data: {
          id: vacancy.id.to_s,
          type: 'vacancies',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(VacancyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { vacancy.reload.attributes }
    end
  end
end
