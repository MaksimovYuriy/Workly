require 'rails_helper'

RSpec.describe ReviewResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'reviews',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ReviewResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Review.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:review) { create(:review) }

    let(:payload) do
      {
        data: {
          id: review.id.to_s,
          type: 'reviews',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ReviewResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { review.reload.updated_at }
      # .and change { review.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:review) { create(:review) }

    let(:instance) do
      ReviewResource.find(id: review.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Review.count }.by(-1)
    end
  end
end
