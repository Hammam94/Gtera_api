module Mutations
  class DeleteProduct < Mutations::BaseSuperAdminMutation
    argument :params, Types::Input::ProductRequestActionInputType, required: true

    field :product, Types::ProductType, null: false

    def resolve(params:)
      request_params = Hash params
      product_id = request_params[:id]
      begin
        product = Spree::Product.find(product_id)
        product.destroy
        { product: product }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end