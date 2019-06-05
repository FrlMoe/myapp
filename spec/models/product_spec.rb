require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike")}
    let(:user) { User.create!(email: "bike@mail.com", password: "random" )}


    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3.0
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

    it "is not valid without a comment" do
      expect(Product.new(description: "I am a nice comment")).not_to be_valid
    end
  end

  context "when a product gets created" do
    let(:product) { Product.create!(name: "race bike")}

    it "is not valid without a name" do
      expect(Product.new(description: "city bike")).not_to be_valid
    end

    it "is not valid without a price" do
      expect(Product.new(price: 100)).not_to be_valid
    end


  end

end
