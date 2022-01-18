class AddApproveAndRejectColumnsForSpreeProductsTable < ActiveRecord::Migration[6.1]
  def change
    change_table :spree_products do |t|
        add_column :spree_products, :approved, :boolean, default: false
        add_column :spree_products, :rejected, :boolean, default: false
    end
  end
end
