require 'rails_helper'

RSpec.describe "resumes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/resumes/#{resume.id}"
  end

  describe 'basic destroy' do
    let!(:resume) { create(:resume) }

    it 'updates the resource' do
      expect(ResumeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Resume.count }.by(-1)
      expect { resume.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
