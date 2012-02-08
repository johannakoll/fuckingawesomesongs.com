require "minitest/pride"
require "minitest/autorun"
require "minitest/unit"
require File.expand_path("lib/track")

class TrackTest < MiniTest::Unit::TestCase
  def test_saves_track_data
    Track.create({:artist => "the artist", :track => "the track", :url => "http://www.example.com"})
    assert_equal "the artist", Track.all.first.artist
    assert_equal "the track", Track.all.first.track
    assert_equal "http://www.example.com", Track.all.first.url
  end
end
