class CommentsController < ApplicationController
  def create
    event = Event.find(params[:comment][:event])
    user = User.find(session[:user_id])
    comment = Comment.new(content: params[:comment][:content], user: user, event: event)
    if !comment.save
      flash[:errors] = comment.errors.full_messages
    end
    return redirect_to controller: 'events', action: 'show', id: event.id
  end
end
