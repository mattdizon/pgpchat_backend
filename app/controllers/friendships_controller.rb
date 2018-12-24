class FriendshipsController < ApiController

    def index
        @friendships = Friendship.all
        render json: @friendships
    end
    def showFriendship
          @friendships = Friendship.where(user_id: params[:user_id])
          render json: @friendships
    end

    def create
        @friendship = Friendship.create(friendship_params)
    end

def destroy
  @friendship = current_user.friendships.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed friendship."
  redirect_to current_user
end
private
def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
end
end
