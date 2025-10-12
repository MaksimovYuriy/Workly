require 'rails_helper'

RSpec.describe "employers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/employers/#{employer.id}"
  end

  describe 'basic destroy' do
    let!(:employer) { create(:employer) }

    it 'updates the resource' do
      expect(EmployerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Employer.count }.by(-1)
      expect { employer.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
