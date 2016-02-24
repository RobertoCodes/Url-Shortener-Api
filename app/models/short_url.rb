class ShortUrl < ActiveRecord::Base

  validates :short, :url, presence: true
  validates :short, uniqueness: true

  def self.random_url
    loop do
      random_url = "http://xyz.com/" + SecureRandom.urlsafe_base64(16)
      return random_url unless ShortUrl.exists?(:short => random_url)
    end
  end

  def self.generate_from_url(long_url)
    ShortUrl.new(url: long_url, short: ShortUrl.random_url)
  end

end
