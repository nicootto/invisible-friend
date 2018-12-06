require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_precense_of(:name) }
end
