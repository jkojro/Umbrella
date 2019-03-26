class SendResultsService

  def initialize(umbrella_id)
    @umbrella_id = umbrella_id
  end

  def call
    umbrella = Umbrella.find(@umbrella_id)

    # If both true => result was already sent
    # If both false => it's not time yet for sending results
    return if umbrella.friends.all? { |f| f.answear.present? } == umbrella.days_to_end.zero?
    UmbrellaMailer.send_results(umbrella).deliver_now
  end
end
