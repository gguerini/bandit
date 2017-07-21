class User < ApplicationRecord
  extend FriendlyId
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable

  friendly_id :username

  has_many :race_reports, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false },
    format: { with: /\A[a-z0-9]+\z/ }, length: { minimum: 1, maximum: 30 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
