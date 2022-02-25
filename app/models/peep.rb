class Peep < ApplicationRecord
  validates :message, presence: true
end
