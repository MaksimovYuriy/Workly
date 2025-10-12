require 'rails_helper'

RSpec.describe "resumes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/resumes/#{resume.id}", params: params
  end

  describe 'basic fetch' do
    let!(:resume) { create(:resume) }

    it 'works' do
      expect(ResumeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('resumes')
      expect(d.id).to eq(resume.id)
    end
  end
end
