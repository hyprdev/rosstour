require 'spec_helper'
require 'rosstour'

describe Rosstour::Services::Rates do
  let(:rosstour) { Rosstour.new(fake_api_base) }
  describe '#rates_cbr' do
    it 'should not throw error' do
      expect{ rosstour.rates_cbr }.not_to raise_error
    end

    it 'should return document' do
      expect( rosstour.rates_cbr ).to be_a Rosstour::RateCBR
    end

    describe 'returned document' do
      it 'should have USD rate' do
        expect( rosstour.rates_cbr ).to respond_to :usd
        expect( rosstour.rates_cbr.usd ).not_to be nil
      end
      it 'should have EUR rate' do
        expect( rosstour.rates_cbr ).to respond_to :eur
        expect( rosstour.rates_cbr.eur ).not_to be nil
      end
    end
  end

  describe '#rates_oper' do
    it 'should not throw error' do
      expect{ rosstour.rates_oper }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.rates_oper ).to be_a Array
    end

    describe 'returned array' do
      it 'should not be empty' do
        expect( rosstour.rates_oper ).not_to be_empty
      end

      it 'should consist of documents' do
        all_documents = rosstour.rates_oper.all? do |document|
          document.is_a? Rosstour::RateOper
        end
        expect( all_documents ).to be true
      end
    end

    describe 'returned document' do
      let(:document) {rosstour.rates_oper.first}
      it 'should have Name field' do
        expect( document ).to respond_to :name
        expect( document ).not_to be nil
      end
    end
  end
end
