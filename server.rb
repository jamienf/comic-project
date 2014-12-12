require 'sinatra'
require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative 'config/application'

# Dir['app/**/*.rb'].each { |file| require_relative file }

def xkcd_image_url(page_url = 'http://xkcd.com/')
  html = open(page_url)
  doc = Nokogiri::HTML(html)
  src = doc.css('img')[2].attr('src')
  "#{src}"
end

def explosm_image_url(page_url = 'http://explosm.net/comics/latest')
  html = open(page_url)
  doc = Nokogiri::HTML(html)
  src = doc.css('img')[6].attr('src')
  "#{src}"
end

def penny_arcade_url(page_url = 'http://www.penny-arcade.com/comic')
  html = open(page_url)
  doc = Nokogiri::HTML(html)
  src = doc.css('img')[0].attr('src')
  "#{src}"
end

# def explosm_image_url(page_url = 'http://explosm.net/comics/latest')
#   html = open(page_url)
#   doc = Nokogiri::HTML(html)
#   src = doc.css('div#main-comic')
#   "#{src}"
# end

get '/' do
@xkcd_img = xkcd_image_url
@explosm_img = explosm_image_url
@pa_img = penny_arcade_url
  erb :index
end

get '/settings' do

  erb :settings
end
