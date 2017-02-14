class PatronsController < ApplicationController
  before_action :require_login
  def create
    patron = Patron.new(user: User.find(session[:user_id]), event: Event.find(params[:id]))
    if patron.save
      redirect_to controller: "events", action: "show", id: params[:id]
    else
      flash[:error] = "Something went wrong"
      redirect_to '/events'
    end
  end

  def destroy
    patron = Patron.find(params[:id])
    patron.destroy
    redirect_to '/events'
  end
end
