require 'rails_helper'

# Test suite for the Item model
RSpec.describe Friend, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:group) }
  it { should belong_to(:friend).class_name('User') }
end