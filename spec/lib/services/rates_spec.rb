require 'spec_helper'
require 'rosstour'

describe Rosstour::Services::Rates do
  let(:rosstour) { Rosstour.new(fake_api_base) }
  describe '#rates_cbr' do
    it 'should not throw error' do
      expect{ rosstour.rates_cbr }.not_to raise_error
    end

    it 'should return document' do
      expect( rosstour.rates_cbr ).to be_a Rosstour::Document
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
end
