class Merchant < ApplicationRecord
  
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  

  validates_presence_of :name

  def enabled_or_disabled
    if enabled == true
      "Enabled"
    elsif enabled == false
      "Disabled"
    end
  end

  def button_text
    if enabled == true
      "Disable"
    elsif enabled == false
      "Enable"
    end
  end
end