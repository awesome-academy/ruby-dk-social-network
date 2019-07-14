require "rails_helper"

RSpec.describe Multi, type: :model do
  it { should belong_to(:post) }
end
