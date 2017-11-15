class DrawingBoardManager

  def initialize(data)
    self.params = data
  end

  def save
    save_drawing
    initiate_broadcast
  end

  def self.get_board_summary
    @drawings = Drawing.by_drawing_area
    user_summary = get_leaderboard_users_info
    return @drawings, user_summary
  end

  # Method for get top users drawing summaries for leaderboard
  def self.get_leaderboard_users_info
    user_summary = {}; users = User.by_drawing_summary
    top_users = users.sort {|a,b| b.drawings.size <=> a.drawings.size}
    # &. --- refers Safe Navigation operator
    top_users &.each do |user|
      colors = user.drawings.map(&:color_code)
      user_summary["#{user.name}"] = {total_placed_colors: colors.length,most_used: colors.group_by(&:itself).values.max_by(&:size).first} if colors.present?
    end
    user_summary
  end

  private
  attr_accessor :params, :drawing

  def save_drawing
    @drawing = find_drawing_square
    params_hash = {color_code: params["color_code"], user_id: params["user_id"], drawing_area: params["container"]}
    self.drawing = @drawing.present? ? (@drawing.update(params_hash); @drawing) : Drawing.create!(params_hash)
  end

  def initiate_broadcast
    DrawingBroadcastJob.perform_now(drawing, params["user_name"])
  end

  def find_drawing_square
    Drawing.where(drawing_area: params["container"]).first
  end

end