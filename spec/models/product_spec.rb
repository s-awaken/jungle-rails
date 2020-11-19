require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(:name => "anime")
      @product = Product.new(:name => "Demon Slayer: Kimetsu no Yaiba",:description =>"best in the world",:category => @category,:quantity => 4,:image =>"https://images2.alphacoders.com/100/thumb-1920-1007550.jpg",:price => 3000)
      @product.save
    end
    it 'validate the name field to present' do
      expect(@product.name).to be_present
    end
    it 'validate the price field to present' do
      expect(@product.price).to eql(3000)
    end
    it 'validate the quantity field to present' do
      expect(@product.quantity).to be_present
    end
    it 'validate the category field to present' do
      expect(@product.category).to be_present
    end
    
    it 'validate the price field to nil' do
      @category1 = Category.new(:name => "anime")
      @product1 = Product.new(:name => "Demon Slayer: Kimetsu no Yaiba",:description =>"best in the world",:category => @category,:quantity => 4,:image =>"https://images2.alphacoders.com/100/thumb-1920-1007550.jpg")
      @product1.save
      expect(@product1).to_not be_valid
      expect(@product1.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
    end

  end
end
# :name,
#       :description,
#       :category_id,
#       :quantity,
#       :image,
#       :price