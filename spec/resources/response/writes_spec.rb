require 'rails_helper'

RSpec.describe ResponseResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'responses',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ResponseResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Response.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:response) { create(:response) }

    let(:payload) do
      {
        data: {
          id: response.id.to_s,
          type: 'responses',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ResponseResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { response.reload.updated_at }
      # .and change { response.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:response) { create(:response) }

    let(:instance) do
      ResponseResource.find(id: response.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Response.count }.by(-1)
    end
  end
end
