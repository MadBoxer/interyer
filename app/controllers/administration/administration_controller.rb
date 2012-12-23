class Administration::AdministrationController < ApplicationController
  layout 'administration/category'
  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
  rescue_from ActionController::RoutingError, :with => :render_not_found

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end
  def render_not_found
    render :template => "administration/administration/not_found"
  end

  def set_alias_by_name(type)
    if params[type][:alias].empty?
      params[type][:alias] = Russian::transliterate(params[type][:name]).downcase.parameterize
    end
  end
end
