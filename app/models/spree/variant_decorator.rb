module Spree
  Variant.class_eval do

    attr_accessible :use_master_price
   
    #return product master price if use_master_price flag is set to true 
    def price
      return product.master.price if use_master_price? && !is_master?

      default_price.price

    end

  end
end
