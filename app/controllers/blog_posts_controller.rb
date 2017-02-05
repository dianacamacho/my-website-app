class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_title 

  def index
    @blog_posts = BlogPost.all
    @page_title_details = "Blog"
  end

  def new
    @blog_post = BlogPost.new
    @page_title_details = "New Post"
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      flash[:success] = "Blog post successfully created!"
      redirect_to blog_post_path(@blog_post)
    else
      render :new
    end
  end

  def show
    @page_title_details = "Blog"
  end

  def edit
    @page_title_details = "Edit Post"
  end

  def update
    @page_title_details = "Edit Post"
    
    if @blog_post.update(blog_post_params)
      flash[:success] = "Blog post successfully updated!"
      redirect_to blog_post_path(@blog_post)
    else
      render :edit
    end
  end

  def destroy
    @blog_post.destroy
    flash[:success] = "Blog post successfully deleted!"
    redirect_to blog_posts_path
  end

  private
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:user_id, :title, :text, { images: [] })
    end

    def set_title
      @title = "Blog"
    end
end
