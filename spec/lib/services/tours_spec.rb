require 'spec_helper'
require 'rosstour'

describe Rosstour::Services::Tours do
  let(:rosstour) { Rosstour.new(fake_api_base) }
  describe '#tours_srcs' do
    it 'should not throw error' do
      expect{ rosstour.tours_srcs }.not_to raise_error
    end

    it 'should return array' do
      expect( rosstour.tours_srcs ).to be_a Rosstour::TourSrc
    end

  end



end
