require 'rails_helper'

RSpec.describe "resumes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/resumes", params: params
  end

  describe 'basic fetch' do
    let!(:resume1) { create(:resume) }
    let!(:resume2) { create(:resume) }

    it 'works' do
      expect(ResumeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['resumes'])
      expect(d.map(&:id)).to match_array([resume1.id, resume2.id])
    end
  end
end
