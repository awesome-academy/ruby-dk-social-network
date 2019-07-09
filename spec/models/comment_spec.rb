require "rails_helper"

RSpec.describe Comment, type: :model do
  it "should have one user" do
    comment = Comment.reflect_on_association(:user)
    expect(comment.macro).to eq :has_one
  end
end
