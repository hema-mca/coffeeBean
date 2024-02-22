class Api::V1::EventsController < BaseController

  before_action :set_user

  def index
    @events = Event.search(params[:search]).order(id: :desc)

    render json: { success: true, events: @events }
  end

  def create
    response = EventService.new(type: params[:type], user: @user).call
    render json: response
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end
