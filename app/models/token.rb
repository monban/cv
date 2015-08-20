class Token < ActiveRecord::Base
  validates :key, uniqueness: true
end
