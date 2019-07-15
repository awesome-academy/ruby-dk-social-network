require "rails_helper"

RSpec.describe Photo, type: :model do
  it "should have one user" do
    photo = Photo.reflect_on_association(:post)
    expect(photo.macro).to eq :has_one
  end
end
