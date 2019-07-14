require "rails_helper"

RSpec.describe Post, type: :model do

  it "should have many comment" do
    post = Post.reflect_on_association(:comments)
    expect(post.macro).to eq :has_many
  end

  it "must post something" do
    post = Post.new(content: "test")
    post.content = ""
    expect(post).to_not be_valid
  end
end
