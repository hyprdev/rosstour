require 'spec_helper'
require 'rosstour'

describe Rosstour::Services::Tours do
  let(:rosstour) { Rosstour.new(fake_api_base) }

  RSpec.shared_examples "an api collection method" do |method, document_type, document_fields, params = nil|
    it 'should not throw error' do
      expect{ rosstour.send(method) }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.send(method) ).to be_a Array
    end


    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.send(method) ).not_to be_empty
      end

      it "should consist of documents of type #{document_type}" do
        proper_type = rosstour.send(method).all? do |document|
          document.is_a? document_type
        end
        expect( proper_type ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.send(method).first}

      it 'should not be nil' do
        expect( document ).not_to be nil
      end
      document_fields.each do |field|
        it "should have #{field} field" do
          expect( document ).to respond_to field
        end
      end
    end
  end


  describe '#tours_srcs' do
    it_behaves_like "an api collection method",
      :tours_srcs,
      Rosstour::TourSrc,
      [:id, :name]
  end

  describe '#tours_dsts' do
    fields = [:id, :name]
    context "without params" do
      it_behaves_like "an api collection method",
        :tours_dsts,
        Rosstour::TourDst,
        fields
    end
    context "with params" do
      params = {src: 123}

      it_behaves_like "an api collection method",
        :tours_dsts,
        Rosstour::TourDst,
        fields,
        params
    end
  end

  describe '#tours_opers' do
    it_behaves_like "an api collection method",
      :tours_opers,
      Rosstour::TourOper,
      [:id, :name, :abbr]
  end

  describe '#tours_zones' do
    it_behaves_like "an api collection method",
      :tours_zones,
      Rosstour::TourZone,
      [:id, :name]
  end

  describe '#tours_meals' do
    it_behaves_like "an api collection method",
      :tours_meals,
      Rosstour::TourMeal,
      [:id, :name, :comment, :num]
  end

  describe '#tours_stars' do
    it_behaves_like "an api collection method",
      :tours_stars,
      Rosstour::TourStar,
      [:id, :name, :num]
  end

  describe '#tours_dates' do
    it_behaves_like "an api collection method",
      :tours_dates,
      Rosstour::TourDate,
      [:date]
  end

  describe '#tours_nights' do
    it_behaves_like "an api collection method",
      :tours_nights,
      Rosstour::TourNight,
      [:id, :name]
  end

  describe '#tours_hotels' do
    it_behaves_like "an api collection method",
      :tours_hotels,
      Rosstour::TourHotel,
      [:id, :name, :star, :zone]
  end
end
