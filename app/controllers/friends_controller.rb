class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def update
    if @friend.update(friend_params)
			redirect_to umbrella_friend_path(@friend.umbrella, @friend), notice: "Twoja wypowiedź została dodana"
		else
			render 'edit'
		end
  end

  private

  def friend_params
    params.require(:friend).permit(:answear)
  end

  def set_friend
    @friend = Friend.find(params[:id])
  end
end
