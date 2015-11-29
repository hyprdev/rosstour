$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'byebug'
require 'rosstour'
require 'webmock/rspec'

Dir[ File.dirname(__FILE__)+"/support/**/*.rb" ].each { |f| require f }

RSpec.configure do |config|
  WebMock.disable_net_connect!(allow_localhost: true)

  config.include SharedContext

  config.before(:each) do
    stub_request(:any, Regexp.new(fake_api_base)).to_rack(FakeRosstour)
  end
end
