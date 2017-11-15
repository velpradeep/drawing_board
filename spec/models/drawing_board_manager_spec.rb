require 'rails_helper'

RSpec.describe DrawingBoardManager  do

  describe '.get_board_summary' do

  end

  describe '.get_leaderboard_users_info' do

    context 'when users and drawings found' do
      let(:users) {create_list(:user, 5)}
      let(:drawings) {users.last(2).map{|user|create(:drawing, user_id: user.id)}}

      it 'returns a hash' do
        expect(DrawingBoardManager.get_leaderboard_users_info.class).to be Hash
      end

      it 'returns a hash not to be empty' do
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
      end

    end

  end

end