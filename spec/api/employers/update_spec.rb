require 'rails_helper'

RSpec.describe "employers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/employers/#{employer.id}", payload
  end

  describe 'basic update' do
    let!(:employer) { create(:employer) }

    let(:payload) do
      {
        data: {
          id: employer.id.to_s,
          type: 'employers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(EmployerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { employer.reload.attributes }
    end
  end
end
