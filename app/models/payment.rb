# frozen_string_literal: true

# Create a Payments for invoice
class Payment < ApplicationRecord
  belongs_to :invoice

  validates :date, :value, :kind, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :note, length: { maximum: 200 }

  scope :cash_payments, -> {where( kind: "efectivo" ).sum(:value)}
  scope :card_payments, -> {where( kind: "tarjeta" ).sum(:value)} 

end
