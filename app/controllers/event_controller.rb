class EventController < ApplicationController

  before_action :authenticate_user!
  !

  def event_a
    Rails.logger.info("Current_User: #{current_user.email}")
    render plain: 'Event A created successfully!'
  end

  def event_b
    # Implement logic to create Event B in iterable.com and send email notification
    # response = send_event_b_to_iterable
    Rails.logger.info("Current_User: #{current_user.email}")
    render plain: 'Event B created successfully!'
  end

  private


  def send_event_b_to_iterable
    api_key = Rails.application.config.iterable['api_key']
    base_url = Rails.application.config.iterable['base_url']

    response = self.class.post("#{base_url}/events", headers: { 'Api-Key' => api_key }, body: { event: 'Event B' })
    response
  end

end
