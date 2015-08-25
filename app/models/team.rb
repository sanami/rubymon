class Team < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_many :monsters, dependent: :nullify

  # Fields
  normalize_attribute :team_name

  # Validations
  validates :user, presence: true
  validates :team_name, presence: true, uniqueness: true

  validate on: :create do
    if user && user.teams.count >= 3
      errors[:base] << 'Teams per User limit exceeded'
    end
  end
end
