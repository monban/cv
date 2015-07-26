class Section < ActiveRecord::Base
  validates :title, uniqueness: true
end
