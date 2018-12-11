require 'rails_helper'

RSpec.describe UserAuth, type: :model do
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :provider }
  it { is_expected.to validate_presence_of :provider_uid }

end
