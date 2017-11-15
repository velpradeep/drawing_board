class DrawingBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event, meta_data)
    ActionCable.server.broadcast 'drawing_activity_channel', leader_board: render_leaderboard(event), drawing: event, meta_data: meta_data
  end

  private

  def render_leaderboard(event)
    user_summary = DrawingBoardManager.get_leaderboard_users_info
    ApplicationController.renderer.render(partial: 'drawings/drawing_summary_by_user', locals: { leader_board: user_summary})
  end
end
