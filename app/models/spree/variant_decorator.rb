module Spree
  Variant.class_eval do

    attr_accessible :use_master_price

    #return product master price if use_master_price flag is set to true
    def price
      return 0 unless self.persisted?

      return product.master.price if with_master_price?

      default_price.price
    end

    def display_price
      if with_master_price?
        Spree::Money.new(product.master.price || 0, { currency: currency })
      else
        Spree::Money.new(default_price.amount || 0, { currency: currency })
      end
    end

    def price_in(currency)
      if with_master_price?
        product.master.prices.select{ |price| price.currency == currency }.first || Spree::Price.new(:variant_id => product.master.id, :currency => currency)
      else  
        prices.select{ |price| price.currency == currency }.first || Spree::Price.new(:variant_id => self.id, :currency => currency)
      end
    end

    def with_master_price?
      use_master_price? && !is_master?
    end
  end
end
