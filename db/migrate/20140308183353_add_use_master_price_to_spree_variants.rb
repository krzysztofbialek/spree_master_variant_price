class AddUseMasterPriceToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :use_master_price, :boolean
  end
end
