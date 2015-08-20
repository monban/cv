class Token < ActiveRecord::Base
  validates :key, uniqueness: true

  def expired?
    Time.now > expires_at
  end
end
