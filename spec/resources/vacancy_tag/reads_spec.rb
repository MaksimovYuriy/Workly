require 'rails_helper'

RSpec.describe VacancyTagResource, type: :resource do
  describe 'serialization' do
    let!(:vacancy_tag) { create(:vacancy_tag) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(vacancy_tag.id)
      expect(data.jsonapi_type).to eq('vacancy_tags')
    end
  end

  describe 'filtering' do
    let!(:vacancy_tag1) { create(:vacancy_tag) }
    let!(:vacancy_tag2) { create(:vacancy_tag) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: vacancy_tag2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([vacancy_tag2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:vacancy_tag1) { create(:vacancy_tag) }
      let!(:vacancy_tag2) { create(:vacancy_tag) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            vacancy_tag1.id,
            vacancy_tag2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            vacancy_tag2.id,
            vacancy_tag1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
