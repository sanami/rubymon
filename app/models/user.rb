class User < ActiveRecord::Base
  include OmniauthAccount

  # Relations
  has_many :authentications, dependent: :destroy

  # Include devise modules. Others available are: :confirmable, :lockable, :registerable, :timeoutable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # Scopes
  scope :by_email, ->(email) { where(email: email.try(:strip).try(:downcase)) } # Devise downcase email

  # Fields
  normalize_attribute :full_name, with: [:squish, :blank]

  # Validations
  validates :full_name, presence: true

  def display_name
    "#{full_name} <#{email}>"
  end

  def skip_confirmation!
    self.confirmed_at ||= Time.now.utc
  end
end
