class Administration::ActionsController < ApplicationController
  # GET /administration/actions
  # GET /administration/actions.json
  
  before_filter :only => [:create, :update] do
    if params[:action_item][:alias].empty?
      params[:action_item][:alias] = Russian::transliterate(params[:action_item][:name]).downcase.parameterize
    end
  end
  
  
  def index
    @administration_actions = Action.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administration_actions }
    end
  end

  # GET /administration/actions/1
  # GET /administration/actions/1.json
  def show
    @administration_action = Action.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration_action }
    end
  end

  # GET /administration/actions/new
  # GET /administration/actions/new.json
  def new
    @administration_action = Action.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administration_action }
    end
  end

  # GET /administration/actions/1/edit
  def edit
    @administration_action = Action.find(params[:id])
  end

  # POST /administration/actions
  # POST /administration/actions.json
  def create
    @administration_action = Action.new(params[:action_item])

    respond_to do |format|
      if @administration_action.save
        format.html { redirect_to administration_actions_url, notice: 'Action was successfully created.' }
        format.json { render json: @administration_action, status: :created, location: @administration_action }
      else
        format.html { render action: "new" }
        format.json { render json: @administration_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/actions/1
  # PUT /administration/actions/1.json
  def update
    @administration_action = Action.find(params[:id])

    respond_to do |format|
      if @administration_action.update_attributes(params[:action_item])
        format.html { redirect_to administration_actions_url, notice: 'Action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @administration_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/actions/1
  # DELETE /administration/actions/1.json
  def destroy
    @administration_action = Action.find(params[:id])
    @administration_action.destroy

    respond_to do |format|
      format.html { redirect_to administration_actions_url }
      format.json { head :no_content }
    end
  end
end
