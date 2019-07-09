require "rails_helper"

RSpec.describe General, type: :model do
  it { should belong_to(:user) }
end
