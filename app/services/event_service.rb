class EventService

  attr_reader :type, :user, :event

  def initialize(type:, user:)
    @type = type
    @user = user
  end

  def call
      return false unless ['A','B'].include?(type) || valid_user?

      case type.upcase
      when 'A'
          @event = EventA.new(user_id: user.id)
      when 'B'
          @event = EventB.new(user_id: user.id)
      end

      @event.save!
      @event
      rescue StandardError => e
        Rails.logger.error("error: #{e.message} ")
        return false
  end

  def valid_user?
      @user = User.find_by(id: user.id)
      @user.present?
  end

end
