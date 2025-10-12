require 'rails_helper'

RSpec.describe EmployerResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'employers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      EmployerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Employer.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:employer) { create(:employer) }

    let(:payload) do
      {
        data: {
          id: employer.id.to_s,
          type: 'employers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      EmployerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { employer.reload.updated_at }
      # .and change { employer.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:employer) { create(:employer) }

    let(:instance) do
      EmployerResource.find(id: employer.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Employer.count }.by(-1)
    end
  end
end
