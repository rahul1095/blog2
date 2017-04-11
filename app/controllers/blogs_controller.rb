class BlogsController < ApplicationController
	before_action :authenticate_user!
	def index
		@blogs=Blog.all
	end
	def new
		@blog=Blog.new
	end
	def create
		@blog=Blog.new(blog_params)
			@blog.user_id = current_user.id
		@blog.save
		redirect_to @blog
	end
	def show
		@blog=Blog.find(params[:id])
     end

      def edit
	@blog=Blog.find(params[:id])

	 end

	def update
		@blog=Blog.find(params[:id])
		@blog.update(blog_params)
	 end

	 def my_blogs
	 	@blogs= Blog.where(:user_id => current_user.id)
	 end
private
  def blog_params
    params.require(:blog).permit(:title, :description, :image)
  end

end
