class FriendsController < ApplicationController
  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update(friend_params)
			render plain: "Twoja wypowiedź została dodana"
		else
			render 'edit'
		end
  end

  private

  def friend_params
    params.require(:friend).permit(:answear)
  end
end
