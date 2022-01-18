module Spree::UserDecorator
  def self.prepended(base)
    base.acts_as_approval_user

    base.has_many :requests, class_name: 'ApprovalRequest', foreign_key: 'request_user_id'
    base.has_many :approved_requests, class_name: 'ApprovalRequest', foreign_key: 'respond_user_id'
  end
  Spree::User.prepend self
end
