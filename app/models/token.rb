class Token < ActiveRecord::Base
  validates :key, uniqueness: true
  def self.current
    Token.find_by(id: Thread.current[:user_id])
  end
  def self.set_current(key)
    token = Thread.current[:user_id] = find_by(key: key)
    if token
      token.id
    else
      nil
    end
  end
end
