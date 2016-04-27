class ShortUrl < ActiveRecord::Base

=begin
  include Mongoid::Document
  include Mongoid::Timestamps
=end

  include ShortenUrl


  def redirect_url(host: "localhost", port: 80)

    str = ""
    if port != 80
      str = "http://#{host}:#{port}/shortlies/#{self.reserved_url}" if self.reserved_url.present?
      str = " http://#{host}:#{port}/shortlies/#{self.shorten_url}" if self.reserved_url.blank?
    else
      str = "http://#{host}/shortlies/#{self.reserved_url}" if self.reserved_url.present?
      str = "http://#{host}/shortlies/#{self.shorten_url}" if self.reserved_url.blank?
    end

    str

  end


=begin
  field :is_visible, type: Integer, default: 1
  field :original_url, type: String
  field :shorten_url, type: String # Shoretn using using Bijective (shorten -> original)
  field :reserved_url, type: String # If wanna another shorten Url  ( Reserved -> shorten -> original)
  field :index, type: String
  field :click_count , type: Integer, default: 0
=end



end
