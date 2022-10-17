class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  validates :uid, :pass, presence: true, uniqueness: true
end
