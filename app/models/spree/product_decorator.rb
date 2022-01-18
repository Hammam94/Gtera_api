module Spree::ProductDecorator
  def self.prepended(base)
    base.scope :approved, -> {base.where(approved: true, rejected: false)}
    base.scope :pending, -> {base.where(approved: false, rejected: false)}
    base.scope :rejected, -> {base.where(rejected: true, approved: false)}
  end
  Spree::Product.prepend self
end
