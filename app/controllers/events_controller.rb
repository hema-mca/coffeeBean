class EventsController < ApplicationController

  before_action :authenticate_user!
  before_action :log_user

  def index
    @events = Event.search(params[:search]).order(id: :desc)
    respond_to do |format|
      format.html
      format.json { render json: {success: true, events: @events}}
    end
   end

  def create
    service = EventService.new(type: params[:type], user: current_user)

    if service.call
      msg = "Event #{params[:type]} created successfully!"
      flash[:alert] = msg
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: {success: true, event: service.event, message: msg}}
      end
    else
      msg = "Event creation Failed!!"
      flash[:notice] = msg
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: {success: false, event: nil, message: msg}}
      end
    end
  end

  private

  def log_user
    Rails.logger.info("Current_User: #{current_user.email}")
  end

end
