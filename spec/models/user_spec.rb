require 'rails_helper'

RSpec.describe User, type: :model do
  
  user = described_class.new

  describe "Validations" do

    it 'is not valid without first_name, last_name and contact' do 
      user.first_name = nil
      user.last_name = nil
      user.contact = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without all required fields' do 
      user.first_name = nil
      user.last_name = nil
      user.contact = nil
      user.email = nil
      user.password = nil
      expect(user).to_not be_valid
    end 

    it 'is valid with all required fields' do 
      user.first_name = "Test"
      user.last_name = "User"
      user.contact = "6859869586"
      user.email = "test@tportal.com"
      user.password = "password"
      expect(user).to be_valid
    end

    it 'is not valid without same password and password_confirmation' do 
      user.first_name = "Test"
      user.last_name = "User"
      user.contact = "6859869586"
      user.email = "test@tportal.com"
      user.password = "password"
      user.password_confirmation = "PASSWORD"
      expect(user).to_not be_valid
    end

    it 'is not valid with same password and password_confirmation values' do 
      user.first_name = "Test"
      user.last_name = "User"
      user.contact = "6859869586"
      user.email = "test@tportal.com"
      user.password = "password"
      user.password_confirmation = "password"
      expect(user).to be_valid
    end

  end

  describe "Transaction" do 

    it "has none to begin with" do 
      expect(User.count).to eq 0
    end

  end

end
