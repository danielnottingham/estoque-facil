require 'rails_helper'

RSpec.describe BusinessUnit, type: :model do
  context 'presence' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
  end
end
