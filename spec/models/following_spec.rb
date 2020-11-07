require 'rails_helper'

  RSpec.describe Following, type: :model do
    let(:test_follower) { User.create(username: 'ramin', full_name: 'Ramin Mammadzada') }
    let(:test_followed_user) { User.create(username: 'nimoto', full_name: 'Nimoto Mammadzada') }
    let(:test_following) { described_class.new(follower_id: test_follower.id, followed_user_id: test_followed_user.id) }

    describe 'validations' do
      it 'should be valid, because both users actually exist' do
        expect(test_following).to be_valid
      end
      it "should be invalid, because the follower doesn't exist" do
        test_following.followed_user_id = -1
        expect(test_following).to  be_invalid
      end
      it "should be invalid, because the followed doesn't exist" do
        test_following.follower_id = -1
        expect(test_following).to be_invalid
      end
    end

    describe 'relations' do
      it { is_expected.to belong_to(:follower) }
      it { is_expected.to belong_to(:followed) }
    end
  end