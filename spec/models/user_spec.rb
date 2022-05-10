require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create
    @user.password = "test"
    @user.password_confirmation = "test"
    @user.email = "TEST@TEST.COM"
    @user.name = "test_name"
    @user.save
  end

  describe 'password and password_confirmation' do
    context 'must match' do
      it 'returns true' do
        expect(@user.password).to eql(@user.password_confirmation)
      end

      it 'returns true' do
        @user.password_confirmation = "testing"
        @user.save
 
        expect(@user.password).not_to eql(@user.password_confirmation)
      end
    end
  end

  describe 'email is unique' do
    context 'and not case sensitive' do
      it 'returns true' do
        user = User.create({ name: 'Bob Smith', email: 'abc@gmail.com', password: '1234', password_confirmation: '1234'})
        expect(user).to eql(User.authenticate_with_credentials('aBc@GMaIL.cOm', '1234'))
      end
    end
  end

  describe 'name is required' do
    context '' do 
      it 'returns true' do 
        @user.name = nil
        @user.save
        
        expect(@user.valid?).to be_falsey
      end
    end
  end

  describe 'password minimum length' do
    context 'is 4 characters long' do 
      it 'returns true' do 
        @user.password = '123'
        @user.save
        
        expect(@user).not_to be_valid
      end 
    end
  end


end