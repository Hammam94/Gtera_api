class ApprovalRequest < Approval::Request
  belongs_to :request_user, class_name: 'Spree::User', foreign_key: 'request_user_id'
  belongs_to :respond_user, class_name: 'Spree::User', foreign_key: 'respond_user_id'
end
