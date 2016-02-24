class ShortUrl > ActiveRecord::Base

  validates :short, :url, presence: true
  validates :short, uniqueness: true


end
