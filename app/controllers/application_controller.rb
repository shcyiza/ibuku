class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def link_it
    Link.create! idea_id: params[:idea_id], linkable_id: params[:linkable_id], linkable_type: params[:linkable_type]
    redirect_to :back, notice: 'Linked successfully created.'
  end

end
