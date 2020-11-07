require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) do
    described_class.new(
        username: 'ramin',
        fullname: 'Ramin Mammadzada',
        photo: 'https://picsum.photos/400',
        coverImage: 'https://picsum.photos/200'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:fullname) }
    it { is_expected.not_to validate_presence_of(:photo) }
    it { is_expected.not_to validate_presence_of(:coverImage) }

    it "should be invalid, so empty string is sent as a username" do
      test_user.username = ''
      expect(test_user).to be_invalid
    end

    it "should be invalid, so empty string is sent as a fullname" do
      test_user.full_name = ''
      expect(test_user).to be_invalid
    end

    it "should be valid, so non empty string is sent as a username" do
      test_user.username = 'Me'
      expect(test_user).to be_valid
    end

    it "should be valid, so non empty string is sent as a fullname" do
      test_user.fullname = 'my_username_here'
      expect(test_user).to be_valid
    end

    it "expects the subject to me invalid for it's full_name doesn't match the length requirements" do
      test_user.full_name = 'Me'
      expect(test_user).not_to be_valid
    end
    it "expects the subject to me invalid for it's full_name doesn't have a cover_image" do
      test_user.full_name = 'This is some ridiculously long string, because we need it to be.'
      expect(test_user).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:opinions) }
    it { is_expected.to have_many(:followers) }
    it { is_expected.to have_many(:followed_users) }
  end
end