require 'minitest/autorun'
require "quinigem"

class QuiniGemTest < MiniTest::Unit::TestCase

  def test_creation
    q = Quinigem::Scrapper.new "pri", "07112014"
    assert_kind_of Quinigem::Scrapper, q

    q = Quinigem::Scrapper.new "blah", "pri", "07112014"
    assert_kind_of Quinigem::Scrapper, q
  end

  def test_invalid_creation
  end

  def test_get_winners
    q = Quinigem::Scrapper.new "pri", "07112014"
    winners = q.winners
    refute_nil winners
    refute_empty winners
    assert_equal 20, winners.size
  end

  def test_get_no_winners
    q = Quinigem::Scrapper.new "pri", "09112014"
    assert_empty q.winners
  end
end
