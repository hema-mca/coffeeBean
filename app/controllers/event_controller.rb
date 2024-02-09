class EventController < ApplicationController

  before_action :authenticate_user!
  before_action :log_user

  def index
    @events = Event.all
  end

  def event_a
    event = EventA.new(user_id: current_user.id)
    if event.save
      flash[:alert] = 'Event A created successfully!'
    else
      flash[:notice] = 'Event A creation Failed!!'
    end

    redirect_to root_path
  end

  def event_b
    # Implement logic to create Event B in iterable.com and send email notification
    # response = send_event_b_to_iterable

    event = EventB.new(user_id: current_user.id)
    if event.save
      # service = NotificationService.new(user: current_user, event: EVENT_B)
      flash[:alert] = 'Event B created successfully!'
    else
      flash[:notice] = 'Event B creation Failed!!'
    end

    redirect_to root_path
  end

  private

  def log_user
    Rails.logger.info("Current_User: #{current_user.email}")
  end


  def send_event_b_to_iterable
    api_key = Rails.application.config.iterable['api_key']
    base_url = Rails.application.config.iterable['base_url']

    response = self.class.post("#{base_url}/events", headers: { 'Api-Key' => api_key }, body: { event: 'Event B' })
    response
  end

end
