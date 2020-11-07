require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:test_user) { User.create(username: 'ramin', full_name: 'Ramin Mammadzada') }
  let(:test_opinion) { described_class.new(text: 'This is the text.', author_id: test_user.id) }

  describe 'validations' do
    it 'should be valid for everything is valid' do
      expect(test_opinion).to be_valid
    end
    it "should be invalid for the author_id doesn't exist" do
      test_opinion.author_id = 3
      expect(test_opinion).to be_invalid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end