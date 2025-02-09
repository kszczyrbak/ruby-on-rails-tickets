class EventsController < ApplicationController
  before_action :check_logged_in, :only => [:new, :create]
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    event_params = params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)

    @event = Event.new(event_params)
    if @event.save
      flash[:message] = "Event has been successfully created"
      redirect_to "/events/#{@event.id}"
    else
      render "new"
    end
  end

  private

  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
      username == "admin" && password == "admin"
    end
  end
end
