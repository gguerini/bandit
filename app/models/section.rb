class Section < ApplicationRecord
  belongs_to :race_report, optional: true

  validates :title, presence: true
  validates :description, presence: true
  validates :order, presence: true, numericality: true

  default_scope { order(order: :asc) }
end
