class EventsController < ApplicationController
  before_action :require_login, only: [:index, :show, :create]

  def index
    @user = User.find(session[:user_id])
    @events_in_state = Event.all.where(state: @user.state)
    @events_out_of_state = Event.all.where.not(state: @user.state)
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @comments = Comment.all.where(event: @event)
    @comment = Comment.new
  end

  def create
    user = User.find(session[:user_id])
    event = Event.new(event_params)
    event.user = user
    if event.save
      flash[:success] = "Event created!"
    else
      flash[:notice] = event.errors.messages
    end
    redirect_to '/events'
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to action: 'show', id: params[:id]
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to '/events'
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :event_date,
      :city,
      :state
    )
  end
end
