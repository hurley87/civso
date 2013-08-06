class CommentsController < ApplicationController
  
before_filter :load_commentable
before_filter :init
  
  def index
    @comments = @commentable.comments
  end

  def new
    #redirect_to @commentable
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])

    @comment.user_id = current_user.id
    #@comment.org_id = @id # org_id not used anymore, using polymorphic now
    @comment.commenter = current_user.name
    
    if @comment.save
      flash[:success] = 'Comment created'
      redirect_to @commentable
    else
      render :new #TODO redirect to original org 'orgs/:id/'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to orgs_url
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def init
    @resource, @id = request.path.split('/')[1, 2]

  end
  # def load_commentable
  #   klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end
  
#ORIGINAL--
#  def create
#      @org = Org.find(params[:org_id])
#      @comment = @org.comments.create(params[:comment])
#      #@comment = current_user.comments.create(params[:comment])
#      
#      redirect_to org_path(@org)
#    end
#
#  def destroy
#    @org = Org.find(params[:org_id])
#    @comment = @org.comments.find(params[:id])
#    @comment.destroy
#    redirect_to org_path(@org)
#  end



end
