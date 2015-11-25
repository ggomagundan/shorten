class ShortUrl

  include Mongoid::Document
  include Mongoid::Timestamps

  include ShortenUrl

  field :is_visible, type: Integer, default: 1
  field :original_url, type: String
  field :shorten_url, type: String
  field :index, type: String



end
