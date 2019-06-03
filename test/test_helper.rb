ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

module Components
  class HelperTestCase < ActionView::TestCase
    def assert_ltrim_dom_equal(expected, resulted)
      assert_dom_equal expected.gsub(/^\s+/, '').gsub(/\n/, ''), resulted.gsub(/^\s+/, '').gsub(/\n/, '')
    end
  end
end
