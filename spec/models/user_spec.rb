require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of(:password)}
    it { should have_secure_token :api_key}
  end
end
