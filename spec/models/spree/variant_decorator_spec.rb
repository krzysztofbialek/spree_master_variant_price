require 'spec_helper'

describe Spree::Variant do

  let(:product) { Factory(:product) }
  let!(:variant) { Factory(:master_price_variant, :count_on_hand => 95, :product => product) }

  describe "#use_master_price" do
    it "returns the master price if set to true" do
      variant.price = variant.product.price + 1
      variant.price.should == variant.product.price      
    end

    it "returns the variant price if set to false" do
      variant.use_master_price = false
      variant.price = variant.product.price + 1
      variant.price.should == variant.product.price + 1      
    end

    it "should use its own price if it's the master variant" do
      product.master.use_master_price = true
      product.price = 10
      product.price.should == 10
      product.master.price.should == 10
    end

  end
end