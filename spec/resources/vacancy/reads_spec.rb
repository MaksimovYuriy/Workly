require 'rails_helper'

RSpec.describe VacancyResource, type: :resource do
  describe 'serialization' do
    let!(:vacancy) { create(:vacancy) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(vacancy.id)
      expect(data.jsonapi_type).to eq('vacancies')
    end
  end

  describe 'filtering' do
    let!(:vacancy1) { create(:vacancy) }
    let!(:vacancy2) { create(:vacancy) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: vacancy2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([vacancy2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:vacancy1) { create(:vacancy) }
      let!(:vacancy2) { create(:vacancy) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            vacancy1.id,
            vacancy2.id
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
            vacancy2.id,
            vacancy1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
