module Spree
  Variant.class_eval do

    attr_accessible :use_master_price
   
    #return product master price if use_master_price flag is set to true 
    def price
      return product.master.price if use_master_price? && !is_master?

      default_price.price
    end

    def display_price
      if use_master_price? && !is_master?
        Spree::Money.new(product.master.price || 0, { currency: currency })
      else
        Spree::Money.new(default_price.amount || 0, { currency: currency })
      end
    end

  end
end
