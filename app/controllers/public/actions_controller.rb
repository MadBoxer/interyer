class Public::ActionsController < ApplicationController
  layout 'public/main'
  def index
    
  end
  
  def show
    @action = Action.active.find_by_alias(params['action_name'])
  end
end
