require 'rails_helper'

  RSpec.describe Following, type: :model do
    let(:test_follower) { User.create(username: 'ramin', fullname: 'Ramin Mammadzada') }
    let(:test_followed_user) { User.create(username: 'nimoto', fullname: 'Nimoto Mammadzada') }
    let(:test_following) { described_class.new(followerId: test_follower.id, followedId: test_followed_user.id) }

    describe 'validations' do
      it 'should be valid, because both users actually exist' do
        expect(test_following).to be_valid
      end
      it "should be invalid, because the follower doesn't exist" do
        test_following.followedId = -1
        expect(test_following).to  be_invalid
      end
      it "should be invalid, because the followed doesn't exist" do
        test_following.followerId = -1
        expect(test_following).to be_invalid
      end
    end

    describe 'relations' do
      it { is_expected.to belong_to(:follower) }
      it { is_expected.to belong_to(:followed) }
    end
  end