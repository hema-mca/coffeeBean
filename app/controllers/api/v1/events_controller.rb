class Api::V1::EventsController < BaseController

  before_action :set_user

  def index
    @events = @user.events.order(id: :desc).decorate

    render json: { success: true, events: @events }
  end

  def create
    response = EventService.new(type: params[:type], user: @user).call
    render json: response
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
    render json: { success: false, events: [], errors: ['User must be present'] }, status: 400 and return unless @user
  end
end
