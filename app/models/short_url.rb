class ShortUrl < ActiveRecord::Base

  validates :short, :url, presence: true
  validates :short, uniqueness: true

  #whatever the application domain will be. Local host for testing.
  DOMAIN = "http://localhost:3000/"

  def self.random_code
    loop do
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless ShortUrl.exists?(:short => random_code)
    end
  end

  def self.generate_from_url(long_url)
    ShortUrl.new(url: long_url, short: ShortUrl.random_code)
  end

end
