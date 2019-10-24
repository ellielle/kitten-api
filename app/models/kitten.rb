class Kitten < ApplicationRecord
  validates :age, presence: true, numericality: true, inclusion: { in: 0..20 }
  validates :name, presence: true
  validates :softness, presence: true
  validates :cuteness, presence: true
end
