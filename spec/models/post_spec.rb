require "rails_helper"

RSpec.describe Post, type: :model do

  it "should have many comment" do
    post = Post.reflect_on_association(:comments)
    expect(post.macro).to eq :has_many
  end
end
