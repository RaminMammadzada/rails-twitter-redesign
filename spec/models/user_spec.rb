require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user1) do
    described_class.new(
      username: 'ramin',
      fullname: 'Ramin Mammadzada'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:fullname) }
    it { is_expected.to validate_presence_of(:photo) }
    it { is_expected.to validate_presence_of(:cover_image) }

    it 'should be invalid, so empty string is sent as a username' do
      test_user1.username = ''
      expect(test_user1).to be_invalid
    end

    it 'should be invalid, so empty string is sent as a fullname' do
      test_user1.fullname = ''
      expect(test_user1).to be_invalid
    end

    it 'should be valid, so non empty string is sent as a username' do
      test_user1.username = 'Me'
      expect(test_user1).to be_valid
    end

    it 'should be valid, so non empty string is sent as a fullname' do
      test_user1.fullname = 'my_username_here'
      expect(test_user1).to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:opinions) }
    it { is_expected.to have_many(:followers) }
    it { is_expected.to have_many(:followed_users) }
  end
end
