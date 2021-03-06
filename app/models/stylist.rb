# frozen_string_literal: true

class Stylist < ApplicationRecord
  belongs_to :business
  has_many :deductions, dependent: :destroy

  validates :dni, :name, :actived, :role, presence: true
  validates :dni, uniqueness: true
end
