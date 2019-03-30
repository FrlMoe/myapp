require 'rails_helper'

describe Order do
    let(:product) { Product.create!(name:"Bike", description:"I am a bike", image_url:"bike.jpg" )}
    let(:user) {User.create!(email: "bike@mail.com", password: "random")}

    it "is a valid order" do
      expect(Order.new( user: user, product: product)).to be_valid
    end

    it "is not valid without a user" do
      expect(Order.new( product: product)).not_to be_valid
    end

    it "is not valid without product" do
      expect(Order.new( user: user)).not_to be_valid
    end
  end
