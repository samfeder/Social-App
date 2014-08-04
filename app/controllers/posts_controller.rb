class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    @post.links.build(link_params)

    if @post.save
      # redirect_to...
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def new
    @post = Post.new
    render :new
  end

  def show

  end

  def edit

  end

  def destroy

  end

  def index

  end

  def update

  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, shared_circle_ids: [])
  end

  def link_params
    params.permit(links: :address)
          .require(:links)
          .values
          .reject { |data| data.values.all?(&:blank?) }
  end

  # def circle_params
  #   circle_ids = params.require(:post)
  #     .permit(shared_circles_id: []).values.flatten
  #   circle_ids.each_with_object([]) do |value, array|
  #     array << { "circle_id" => value }
  #   end
  # end

end
