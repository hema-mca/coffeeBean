class EventService < BaseService
  attr_reader :type, :user, :event

  validates :user, :presence => true
  validates :type, :inclusion => %w(A B)

  validate :valid_user

  def initialize(type:, user:)
    @type = type
    @user = user
  end
  def call
    return { success: false, event: nil, errors: errors.full_messages } unless valid?

    case type.upcase
    when 'A'
      @event = EventA.new(user_id: user.id)
    when 'B'
      @event = EventB.new(user_id: user.id)
    else
      @event = nil
    end
    @event.save!

    { success: true, event: @event, errors: errors.full_messages }
    rescue StandardError => e
      errors.add(:base,"#{e.message}")
      return { success: false, event: nil, errors: errors.full_messages }
  end

  def valid_user
    @user = User.find_by(id: user&.id)
    errors.add(:base, "User must be valid") unless @user
  end
end
