require 'rails_helper'

RSpec.describe ResumeResource, type: :resource do
  describe 'serialization' do
    let!(:resume) { create(:resume) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(resume.id)
      expect(data.jsonapi_type).to eq('resumes')
    end
  end

  describe 'filtering' do
    let!(:resume1) { create(:resume) }
    let!(:resume2) { create(:resume) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: resume2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([resume2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:resume1) { create(:resume) }
      let!(:resume2) { create(:resume) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            resume1.id,
            resume2.id
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
            resume2.id,
            resume1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
