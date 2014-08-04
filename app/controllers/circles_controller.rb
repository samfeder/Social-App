class CirclesController < ApplicationController

  def index
  end

  def show
    @circle = Circle.find(params[:id])
    render :show
  end

  def create
    @circle = current_user.owned_circles.build(circle_params)
    @circle.memberships.build(membership_params)

    if @circle.save
      redirect_to user_circle_url(@circle)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def new
    @circle = Circle.new
    render :new
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def circle_params
    params.require(:circle).permit(:owner_id, :name)
  end

  def membership_params
    # Whaaa?
    member_ids = params.require(:circle).permit(member_id: []).values.flatten
    member_ids.each_with_object([]) do |value, array|
      array << { "member_id" => value }
    end
  end

end
