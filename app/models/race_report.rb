class RaceReport < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy

  accepts_nested_attributes_for :sections, allow_destroy: true

  enum status: {
    active: 1,
    deleted: 2
  }

  store_accessor :goals,
    :goal_a, :goal_a_completed,
    :goal_b, :goal_b_completed,
    :goal_c, :goal_c_completed

  validates :user, presence: true
  validates :name, presence: true
  validates :race_date, presence: true
  validates :status, presence: true

  after_initialize :set_default_values, if: :new_record?

  private

  def set_default_values
    self.status ||= :active
  end
end
