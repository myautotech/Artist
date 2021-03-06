class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments ||= Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment.update(is_readed: true)
    redirect_to blog_path(@comment.blog)
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @blog ||= Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    @comment.name, @comment.email = \
    Profile.artist_comment(params[:profile][:id]) if params[:profile]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @blog ||= Blog.find(params[:blog_id])
    @comment ||= @blog.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @blog, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment ||= Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:name, :email, :comment, :like, :dislike)
  end
end
