require 'rails_helper'

describe Comment do
  context "when a comment gets created" do
    let(:user) { User.create!(email: "bike@mail.com", password: "random" )}
    let(:product){ Product.create!(name: "Bike")}

    it "not valid without a rating" do
      expect(Comment.new(rating: nil)).to_not be_valid
    end

    it "is not valid without a body" do
      expect(Comment.new(body: nil)).not_to be_valid
    end

    it "is not valid without a product_id" do
      expect(Comment.new(product_id: nil)).to_not be_valid
    end

    it "not valid without a user" do
          expect(product.comments.new(user_id: nil, product_id: product.id, body: "Furchtbar netter Text")).to_not be_valid
    end


  end
end
