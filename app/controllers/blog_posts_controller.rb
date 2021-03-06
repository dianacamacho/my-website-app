class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :check_visibilty, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blog_posts = BlogPost.published.order(show_date: :desc)
    @page_title_details = "Blog"
  end

  def new
    @blog_post = BlogPost.new
    @page_title_details = "New Post"
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @page_title_details = "New Post"
    
    if @blog_post.save
      unless blog_post_params[:show_date].present?
        @blog_post.update(show_date: @blog_post.created_at)
      end
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
    @blog_post.remove_images!
    flash[:success] = "Blog post successfully deleted!"
    redirect_to blog_posts_path
  end

  def unpublished_posts
    @draft_posts = BlogPost.drafts.order(show_date: :desc)
    @upcoming_posts = BlogPost.upcoming.order(show_date: :desc)
    @page_title_details = "Unpublished Posts"
  end

  private
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:user_id, :title, :text, :show_date, :draft, { images: [] })
    end

    def check_visibilty
      unless current_user || @blog_post.viewable?
        flash[:warning] = "That post is not currently available!"
        redirect_to blog_posts_path
      end
    end
end
