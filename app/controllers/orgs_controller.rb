class OrgsController < ApplicationController

  #http_basic_authenticate_with :name => "dhh", :password => "secret", :except => [:index, :show]

  # GET /orgs
  # GET /orgs.json
  def index
    @orgs = Org.paginate(page: params[:page], per_page: 10, :order => "created_at DESC")
  
  end

  # GET /orgs/1
  # GET /orgs/1.json
  def show
    @org = Org.find(params[:id])
    @commentable = @org
    @comments = @commentable.comments
    @comment = Comment.new
  
  end

  # GET /orgs/new
  # GET /orgs/new.json
  def new
    if signed_in?
      @org = Org.new
    else
      flash[:error] = "Please sign in to org"
      redirect_to('/signin')
    end

    
  end

  # GET /orgs/1/edit
  def edit
    @org = Org.find(params[:id])
  end

  # POST /orgs
  # POST /orgs.json
  def create
    @org = current_user.orgs.create(params[:org])

    if @org.save
      flash[:success] = 'Org was successfully created.'
      redirect_to @org
    else
      render :new
    end

  end

  # PUT /orgs/1
  # PUT /orgs/1.json
  def update
    @org = Org.find(params[:id])

      if @org.update_attributes(params[:org])
        flash[:success] = 'Org was successfully created.'
        redirect_to @org 
      else
        render action: "edit"
      end
  end

  # DELETE /orgs/1
  # DELETE /orgs/1.json
  def destroy
    @org = Org.find(params[:id])
    @org.destroy

    redirect_to orgs_url
  end
end
