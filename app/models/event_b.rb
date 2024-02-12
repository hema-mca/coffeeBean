class EventB < Event

  after_commit :notify_email

  def name
    'B'
  end

  private

  # Note: here, we need to implement Email delivery service to trigger email after B event saved in DB.
  def notify_email
    # api_key = Rails.application.config.iterable['api_key']
    # base_url = Rails.application.config.iterable['base_url']
    # response = self.class.post("#{base_url}/events", headers: { 'Api-Key' => api_key }, body: { event: 'Event B' })
    # response
  end

end
