require "rails_helper"

RSpec.describe Like, type: :model do
  it "should have one user" do
    like = Like.reflect_on_association(:user)
    expect(like.macro).to eq :has_one
  end
end
