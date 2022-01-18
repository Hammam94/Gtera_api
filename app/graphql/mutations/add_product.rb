module Mutations
  class AddProduct < Mutations::BaseMutation
    argument :params, Types::Input::ProductInputType, required: true

    field :product, Types::ProductType, null: false

    def resolve(params:)
      all_params = Hash params
      product_params = all_params.except(:shipping_category)
      product_params[:shipping_category_id] = all_params[:shipping_category][:id]

      begin
        product_importer = Spree::Core::Importer::Product.new(nil, product_params)
        product = product_importer.create

        { product: product }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end