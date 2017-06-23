# frozen_string_literal: true

require 'twitter'

tweet = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

today = Date.today

case today.strftime('%d-%m')
when '29-11'
  album = "💿 'A Midsummer Nice Dream' (Toytronic)"
  release_year = 2004
  url = 'https://ochre.bandcamp.com/album/a-midsummer-nice-dream'
when '10-07'
  album = "💿 'Lemodie' (Benbecula)"
  release_year = 2006
  url = 'https://ochre.bandcamp.com/album/lemodie'
when '20-07'
  album = "💿 'Like Dust of the Balance' (Benbecula)"
  release_year = 2009
  url = 'https://ochre.bandcamp.com/album/like-dust-of-the-balance'
when '01-08'
  album = "🎵 'Early Learning'"
  release_year = 2011
  url = 'https://ochre.bandcamp.com/album/early-learning'
when '21-01'
  album = "🎵 'National Ignition' (Aura Materia)"
  release_year = 2013
  url = 'https://ochre.bandcamp.com/album/national-ignition'
when '13-01'
  album = "💿 'Isolette' (Shipwrec)"
  release_year = 2015
  url = 'https://ochre.bandcamp.com/album/isolette'
when '24-02'
  album = "🎵 'Beyond the Outer Loop' (Aura Materia)"
  release_year = 2017
  url = 'https://ochre.bandcamp.com/album/beyond-the-outer-loop'
end

unless release_year.nil?
  age = today.year - release_year
  age =
    if age < 2
      'a year'
    else
      "#{age} years"
    end

  tweet.update("🤖💬 #{album} was released on this day, #{age} ago! 🎂 🎉 #{url}")
end
