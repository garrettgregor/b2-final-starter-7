class Transaction < ApplicationRecord
  validates_presence_of :invoice_id,
                        :credit_card_number,
                        :result

  scope :successful, -> { where(result: "success") }

  default_scope { order(:id) }

  enum result: [:failed, :success]

  belongs_to :invoice
  belongs_to :coupon, optional: true
end
