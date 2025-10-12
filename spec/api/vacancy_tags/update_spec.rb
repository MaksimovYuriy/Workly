require 'rails_helper'

RSpec.describe "vacancy_tags#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/vacancy_tags/#{vacancy_tag.id}", payload
  end

  describe 'basic update' do
    let!(:vacancy_tag) { create(:vacancy_tag) }

    let(:payload) do
      {
        data: {
          id: vacancy_tag.id.to_s,
          type: 'vacancy_tags',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(VacancyTagResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { vacancy_tag.reload.attributes }
    end
  end
end
