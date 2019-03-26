class UmbrellaResultMailSenderJob < ApplicationJob
  def perform(umbrella_id)
    SendResultsService.new(umbrella_id).call
  end
end
