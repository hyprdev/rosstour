module SharedContext
  extend RSpec::SharedContext

  let(:fake_api_base) { 'api.rosstur' }
end

RSpec.configure do |config|
  config.include SharedContext
end
