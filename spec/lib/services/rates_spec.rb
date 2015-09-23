require 'spec_helper'
require 'rosstour'

describe Rosstour::Services::Rates do
  let(:rosstour) { Rosstour.new(fake_api_base) }
  describe '#rates_cbr' do
    it 'should not throw error' do
      expect{ rosstour.rates_cbr }.not_to raise_error
    end
  end
end
