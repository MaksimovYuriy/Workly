require 'rails_helper'

RSpec.describe "employers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/employers", payload
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
          type: 'employers',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(EmployerResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Employer.count }.by(1)
    end
  end
end
