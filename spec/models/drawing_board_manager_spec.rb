require 'rails_helper'

# Shared Examples written same method we are testing into the different places
RSpec.shared_examples "calling get_leaderboard_users_info method" do |parameter1, parameter2|

  context "when passing extra params" do
    it "should raise an ArgumentError error if one parameters passed" do
      expect { DrawingBoardManager.get_leaderboard_users_info(parameter1) }.to raise_error(ArgumentError)
    end

    it "should raise an ArgumentError error if more than one  parameters passed" do
      expect { DrawingBoardManager.get_leaderboard_users_info(parameter1, parameter2) }.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe DrawingBoardManager  do

  describe '.get_board_summary' do
    # Calling the Shared Examples
    include_examples "calling get_leaderboard_users_info method", "parameter1", "parameter2"
  end

  describe '.get_leaderboard_users_info' do
    # Calling the Shared Examples
    include_examples "calling get_leaderboard_users_info method", "parameter1", "parameter2"

    context 'when users and drawings found' do
      let(:users) {create_list(:user, 5)}
      let(:drawings) {users.last(2).map{|user|create(:drawing, user_id: user.id)}}

      it 'returns a hash' do
        expect(DrawingBoardManager.get_leaderboard_users_info.class).to be Hash
      end

      it 'returns a hash and not to be empty' do
        expect(DrawingBoardManager.get_leaderboard_users_info.size).to be >= 0
      end

      it 'returns a hash size is 2' do
        results = drawings
        expect(DrawingBoardManager.get_leaderboard_users_info.size).to eq(results.size)
      end

      it 'returns results of last 2 users' do
        data = users.last(2)
        user_drawings= drawings
        user_names = DrawingBoardManager.get_leaderboard_users_info
        expect(user_names.keys).to eq(data.map(&:name))
        expect(user_names.keys.length).to eq(user_drawings.length)
      end
    end
  end

end