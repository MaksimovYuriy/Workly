require 'rails_helper'

RSpec.describe EmployerResource, type: :resource do
  describe 'serialization' do
    let!(:employer) { create(:employer) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(employer.id)
      expect(data.jsonapi_type).to eq('employers')
    end
  end

  describe 'filtering' do
    let!(:employer1) { create(:employer) }
    let!(:employer2) { create(:employer) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: employer2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([employer2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:employer1) { create(:employer) }
      let!(:employer2) { create(:employer) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            employer1.id,
            employer2.id
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
            employer2.id,
            employer1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
