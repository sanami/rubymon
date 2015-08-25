class Monster < ActiveRecord::Base
  # Relations
  belongs_to :user
  belongs_to :monster_type
  belongs_to :team

  # Fields
  normalize_attribute :monster_name

  # Validations
  validates :user, :monster_type, presence: true
  validates :monster_name, presence: true, uniqueness: true
  validates :monster_power, presence: true, numericality: true

  validate do
    if team
      if team.user != user
        errors[:team] << 'must belong to user'
      end

      if team_id_changed? && team.monsters.count >= 3
        errors[:base] << 'Monsters per Team limit exceeded'
      end
    end
  end

  validate on: :create do
    if user && user.monsters.count >= 20
      errors[:base] << 'Monsters per User limit exceeded'
    end
  end
end
