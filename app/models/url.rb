class Url < ActiveRecord::Base
  before_save :short_url

  def short_url
    self.short_url = SecureRandom.hex(3)
  end
end
