class Administration::NewsController < Administration::AdministrationController
  # GET /administration/news
  # GET /administration/news.json

  before_filter :only => [:create, :update] do
    if params[:news][:alias].empty?
      params[:news][:alias] = Russian::transliterate(params[:news][:name]).downcase.parameterize
    end
  end

  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end
  def show
    redirect_to :edit
  end

  # GET /administration/news/new
  # GET /administration/news/new.json
  def new
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /administration/news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  # POST /administration/news
  # POST /administration/news.json
  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to :action => 'index', notice: 'News was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/news/1
  # PUT /administration/news/1.json
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to :action => 'index', notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/news/1
  # DELETE /administration/news/1.json
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to administration_news_index_url }
      format.json { head :no_content }
    end
  end

  def get

  end
end
