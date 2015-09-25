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

  describe '#tours_zones' do
    it 'should not throw error' do
      expect{ rosstour.tours_zones }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_zones ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_zones ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_zones.all? do |document|
          document.is_a? Rosstour::TourZone
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_zones.first}
      it 'should have Id field' do
        expect( document ).to respond_to :id
        expect( document ).not_to be nil
      end
    end
  end

  describe '#tours_meals' do
    it 'should not throw error' do
      expect{ rosstour.tours_meals }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_meals ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_meals ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_meals.all? do |document|
          document.is_a? Rosstour::TourMeal
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_meals.first}
      it 'should have Id field' do
        expect( document ).to respond_to :id
        expect( document ).not_to be nil
      end
    end
  end

  describe '#tours_stars' do
    it 'should not throw error' do
      expect{ rosstour.tours_stars }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_stars ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_stars ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_stars.all? do |document|
          document.is_a? Rosstour::TourStar
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_stars.first}
      it 'should have Id field' do
        expect( document ).to respond_to :id
        expect( document ).not_to be nil
      end
    end
  end

  describe '#tours_dates' do
    it 'should not throw error' do
      expect{ rosstour.tours_dates }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_dates ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_dates ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_dates.all? do |document|
          document.is_a? Rosstour::TourDate
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_dates.first}
      it 'should have Date field' do
        expect( document ).to respond_to :date
        expect( document ).not_to be nil
      end
    end
  end

  describe '#tours_nights' do
    it 'should not throw error' do
      expect{ rosstour.tours_nights }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_nights ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_nights ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_nights.all? do |document|
          document.is_a? Rosstour::TourNight
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_nights.first}
      it 'should have Id field' do
        expect( document ).to respond_to :id
        expect( document ).not_to be nil
      end
    end
  end

  describe '#tours_hotels' do
    it 'should not throw error' do
      expect{ rosstour.tours_hotels }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_hotels ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.tours_hotels ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.tours_hotels.all? do |document|
          document.is_a? Rosstour::TourHotel
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.tours_hotels.first}
      it 'should have Id field' do
        expect( document ).to respond_to :id
        expect( document ).not_to be nil
      end
    end
  end
end
