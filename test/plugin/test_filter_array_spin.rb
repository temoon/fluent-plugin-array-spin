require "helper"
require "fluent/plugin/filter_array_spin.rb"

class ArraySpinFilterTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Filter.new(Fluent::Plugin::ArraySpinFilter).configure(conf)
  end
end
