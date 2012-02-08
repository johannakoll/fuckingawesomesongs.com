require "sinatra/base"

require File.expand_path("lib/songs")
require File.expand_path("lib/track")

class Application < Sinatra::Base
  get "/" do
    redirect_to_random_song
  end

  get "/:artist/:track" do
    haml :index
  end

  get "/submit" do
    haml :submit
  end

  post "/submit" do
    Track.create(:artist => params[:artist], :track => params[:track], :url => params[:url])
    haml :thanks
  end

  get "/moderate" do
    haml :moderate
  end

  def redirect_to_random_song
    random_song = Track.all.sample
    if random_song
      redirect "/#{slugify(random_song.artist)}/#{slugify(random_song.track)}"
    else
      haml :index
    end
  end

  def song
    Track.find {|s| slugify(s.artist) == params[:artist] && slugify(s.track) == params[:track]}
  end

  def slugify string
    string.downcase.gsub(/&/, 'and').gsub(/\s+/, '-').gsub(/[^a-z0-9-]/, '')
  end
end
