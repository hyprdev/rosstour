require 'spec_helper'
require 'rosstour'

describe Rosstour::Services::Tours do
  let(:rosstour) { Rosstour.new(fake_api_base) }
  describe '#tours_srcs' do
    it 'should not throw error' do
      expect{ rosstour.tours_srcs }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_srcs ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_srcs ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_srcs.all? do |document|
          document.is_a? Rosstour::TourSrc
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_srcs.first}
      it 'should have Id field' do
        expect( document ).to respond_to :id
        expect( document ).not_to be nil
      end
    end
  end

  describe '#tours_dsts' do
    it 'should not throw error' do
      expect{ rosstour.tours_dsts }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_dsts ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_dsts ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_dsts.all? do |document|
          document.is_a? Rosstour::TourDst
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_dsts.first}
      it 'should have Id field' do
        expect( document ).to respond_to :id
        expect( document ).not_to be nil
      end
    end
  end

  describe '#tours_opers' do
    it 'should not throw error' do
      expect{ rosstour.tours_opers }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_opers ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_opers ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_opers.all? do |document|
          document.is_a? Rosstour::TourOper
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_opers.first}
      it 'should have Id field' do
        expect( document ).to respond_to :id
        expect( document ).not_to be nil
      end
    end
  end
end
