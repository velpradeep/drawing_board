class DrawingsController < ApplicationController
  include Concerns::UserAutoGeneration

  def index
    @drawings, @user_summary = DrawingBoardManager.get_board_summary
  end
end
