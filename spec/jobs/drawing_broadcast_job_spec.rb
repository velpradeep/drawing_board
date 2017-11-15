require 'rails_helper'

RSpec.describe DrawingBroadcastJob, type: :job do

  describe "#perform_later" do

    it "test adapter must be set to :test" do
      ActiveJob::Base.queue_adapter = :test
    end

    it "broadcast a drawing board update" do
      drawing = create(:drawing)
      ActiveJob::Base.queue_adapter = :test
      expect {
        DrawingBroadcastJob.perform_later(drawing, "Murugan")
      }.to have_enqueued_job
    end


  end


end

