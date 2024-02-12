class Api::V1::EventsController < BaseController

  before_action :set_user

  def index
    @events = Event.search(params[:search]).order(id: :desc)

    render json: { success: true, events: @events }
  end

  def create
    service = EventService.new(type: params[:type], user: @user)

    if service.call
      msg = "Event #{params[:type]} created successfully!"
      render json: { success: true, event: service.event, message: msg }
    else
      msg = "Event creation Failed!!"
      render json: { success: false, event: nil, message: msg }
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end
