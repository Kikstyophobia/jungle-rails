require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do 
    @product = Product.new
    @category = Category.new
  end

  describe 'will exist when instantiated' do
    context 'product exists' do
      it 'returns true' do
        @product.name = 'test'
        @product.price = '4'
        @product.quantity = '100'
        @product.category = @category

        expect(@product).to be_valid
      end
    end
  end

  describe 'name validation' do
    context 'name exists' do
      it 'returns true' do
        @product.name = 'test'

        expect(@product.name).to be_present
      end
    end
  end

  describe 'price validation' do
    context 'price exists' do
      it 'returns true' do
        @product.price = '4'

        expect(@product.price).to be_present
      end
    end
  end

  describe 'quantity validation' do
    context 'quantity exists' do
      it 'returns true' do
        @product.quantity = '100'
        
        expect(@product.quantity).to be_present
      end
    end
  end

  describe 'category validation' do
    context 'category exists' do
      it 'returns true' do
        @product.category = @category

        expect(@product.category).to be_present
      end
    end
  end

end
