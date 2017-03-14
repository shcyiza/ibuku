class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def link_it
    if params[:idea_id][:ids].present?
      params[:idea_id][:ids].each do |idea_id|
        unless idea_id == ""
          Link.create! idea_id: idea_id, linkable_id: params[:linkable_id], linkable_type: params[:linkable_type]
        end
      end
      redirect_back fallback_location: root_path, notice: 'Linked successfully created.'
    else
      Link.create! idea_id: params[:idea_id], linkable_id: params[:linkable_id], linkable_type: params[:linkable_type]
      redirect_back fallback_location: root_path, notice: 'Linked successfully created.'
    end
  end

end
