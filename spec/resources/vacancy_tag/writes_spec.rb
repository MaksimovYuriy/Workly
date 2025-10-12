require 'rails_helper'

RSpec.describe VacancyTagResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'vacancy_tags',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VacancyTagResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { VacancyTag.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:vacancy_tag) { create(:vacancy_tag) }

    let(:payload) do
      {
        data: {
          id: vacancy_tag.id.to_s,
          type: 'vacancy_tags',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VacancyTagResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { vacancy_tag.reload.updated_at }
      # .and change { vacancy_tag.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:vacancy_tag) { create(:vacancy_tag) }

    let(:instance) do
      VacancyTagResource.find(id: vacancy_tag.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { VacancyTag.count }.by(-1)
    end
  end
end
