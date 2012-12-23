class Administration::AdvantagesController < Administration::AdministrationController
  # GET /administration/advantages
  # GET /administration/advantages.json

  def index
    @advs = Advantage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @advs }
    end
  end

  # GET /administration/advantages/1
  # GET /administration/advantages/1.json
  def show
    @adv = Advantage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adv }
    end
  end

  # GET /administration/advantages/new
  # GET /administration/advantages/new.json
  def new
    @adv = Advantage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adv }
    end
  end

  # GET /administration/advantages/1/edit
  def edit
    @adv = Advantage.find(params[:id])
  end

  # POST /administration/advantages
  # POST /administration/advantages.json
  def create
    @adv = Advantage.new(params[:advantage])

    respond_to do |format|
      if @adv.save
        format.html { redirect_to administration_advantages_path, notice: 'Advantage was successfully created.' }
        format.json { render json: @adv, status: :created, location: @adv }
      else
        format.html { render action: "new" }
        format.json { render json: @adv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/advantages/1
  # PUT /administration/advantages/1.json
  def update
    @adv = Advantage.find(params[:id])

    respond_to do |format|
      if @adv.update_attributes(params[:advantage])
        format.html { redirect_to @adv, notice: 'Advantage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/advantages/1
  # DELETE /administration/advantages/1.json
  def destroy
    @adv = Advantage.find(params[:id])
    @adv.destroy

    respond_to do |format|
      format.html { redirect_to administration_advantages_url }
      format.json { head :no_content }
    end
  end
end
