class MonsterType < ActiveRecord::Base
  # Relations
  has_many :monsters, dependent: :destroy

  # Fields
  normalize_attribute :type_name

  # Validations
  validates :type_name, presence: true, uniqueness: true
  validates :type_weakness, presence: true, uniqueness: true, numericality: true
end
