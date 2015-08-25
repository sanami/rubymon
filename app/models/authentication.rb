class Authentication < ActiveRecord::Base
  # Relations
  belongs_to :user

  # Fields
  serialize :auth_info, Hash

  # Validations
  validates :uid, :provider, presence: true
  validates :uid, uniqueness: { scope: :provider }
end
