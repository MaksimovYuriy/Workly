require 'rails_helper'

RSpec.describe VacancyResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'vacancies',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VacancyResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Vacancy.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:vacancy) { create(:vacancy) }

    let(:payload) do
      {
        data: {
          id: vacancy.id.to_s,
          type: 'vacancies',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VacancyResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { vacancy.reload.updated_at }
      # .and change { vacancy.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:vacancy) { create(:vacancy) }

    let(:instance) do
      VacancyResource.find(id: vacancy.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Vacancy.count }.by(-1)
    end
  end
end
