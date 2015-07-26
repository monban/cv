class Reference < ActiveRecord::Base
  validates :name, :telephone, presence: true
end
