ENV["RAILS_ENV"] ||= 'test'

$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'active_support'
require 'monetize'
require 'fm_dtos'

# This to fix deprecation warnings and notify the developer that
# we use the below rounding mode
Money.rounding_mode = BigDecimal::ROUND_HALF_UP
Money.default_currency = 'AUD'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :expect }
  config.order = 'random'
end
