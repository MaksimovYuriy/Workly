require 'rails_helper'

RSpec.describe ResumeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'resumes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ResumeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Resume.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:resume) { create(:resume) }

    let(:payload) do
      {
        data: {
          id: resume.id.to_s,
          type: 'resumes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ResumeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { resume.reload.updated_at }
      # .and change { resume.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:resume) { create(:resume) }

    let(:instance) do
      ResumeResource.find(id: resume.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Resume.count }.by(-1)
    end
  end
end
