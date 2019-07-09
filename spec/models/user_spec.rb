require "rails_helper"

RSpec.describe User, type: :model do
  user = User.new(email: "example@gmail.com",
                  password: "123123", password_confirmation: "123123")

  it "has a valid" do
    expect(user).to be_valid
  end

  it "should matching a email" do
    user.email = "example@gmail.com"
    expect(user).to be_an_email
  end

  it "is invalid without a email" do
    user.email = ""
    expect(user).to_not be_valid
  end

  it "is invalid without a password" do
    user.password = ""
    expect(user).to_not be_valid
  end

  it "should have many poss" do
    user = User.reflect_on_association(:posts)
    expect(user.macro).to eq :has_many
  end
end
