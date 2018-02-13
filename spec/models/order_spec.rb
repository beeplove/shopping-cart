require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:customer) }
  it { should belong_to(:status) }
  it { should have_many(:lineitems) }
end
