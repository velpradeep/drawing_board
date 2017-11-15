class DrawingActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "drawing_activity_channel"
  end

  def unsubscribed
  end

  def drawing(data)
    DrawingBoardManager.new(data).save
  end
end

