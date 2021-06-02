class Token < ApplicationRecord
  validates :hash_token, uniqueness: true, presence: true
  validates :responsible, presence: true
end
