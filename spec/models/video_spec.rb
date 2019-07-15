require "rails_helper"

RSpec.describe Video, type: :model do
  it "should have one user" do
    video = Video.reflect_on_association(:post)
    expect(video.macro).to eq :has_one
  end
end
