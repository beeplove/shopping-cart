require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:orders) }

  describe "#first_name" do
    it "should not be empty"
  end
end
