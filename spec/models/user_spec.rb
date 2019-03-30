require 'rails_helper'

describe User do
  context "when user logs in" do

    it "is valid with email and password" do
      expect(User.new(email: "user@mail.com", password: "random")).to be_valid
    end

    it "is not valid without email" do
      expect(User.new(email: nil, password: "random")).not_to be_valid
    end

    it "is not valid without password" do
      expect(User.new(email: "user@mails.com", password: nil))
    end
  end
end
