require 'rails_helper'

RSpec.describe "resumes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/resumes/#{resume.id}", payload
  end

  describe 'basic update' do
    let!(:resume) { create(:resume) }

    let(:payload) do
      {
        data: {
          id: resume.id.to_s,
          type: 'resumes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ResumeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { resume.reload.attributes }
    end
  end
end
