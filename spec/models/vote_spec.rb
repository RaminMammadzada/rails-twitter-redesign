require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:test_user) { User.create(username: 'ramin', fullname: 'Ramin Mammadzada') }
  let(:test_opinion) { Opinion.create(text: 'This is the text.', authorId: test_user.id) }

  let(:test_vote) { Vote.create(voter_id: test_user.id, current_opinion_id: test_opinion.id, vote_type: 'up') }

  describe 'validations' do
    it 'should be valid, because all fields of vote are valid' do
      expect(test_vote).to be_valid
    end
    it "should be valid, because the vote type is valid" do
      test_vote.vote_type = "down"
      expect(test_vote).to  be_valid
    end
    it "should be invalid, because the vote type is invalid" do
      test_vote.voter_id = "invalid_example_vote_type"
      expect(test_vote).to be_invalid
    end
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:opinion) }
  end
end