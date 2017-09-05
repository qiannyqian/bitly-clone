class Url < ActiveRecord::Base
  before_save :shorten_url
  validates :long_url, :format => URI::regexp(%w(http https)), presence: true

  def shorten_url
    self.short_url = SecureRandom.hex(3)
  end
end
