require 'rails_helper'

describe Comment do
  context "when a comment gets created" do
    let(:user) { User.create!(email: "bike@mail.com", password: "random" )}
    let(:product){ Product.create!(name: "Bike")}

    it "not valid without a rating" do
      expect(Comment.new(rating: nil)).to_not be_valid
    end
  end
end
