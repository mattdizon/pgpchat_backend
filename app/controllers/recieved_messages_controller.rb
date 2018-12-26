class RecievedMessagesController < ApplicationController
    def index
        @recieved_messages = RecievedMessage.all
        render json: @recieved_messages
    end
    def showRecievedMessages
          @recieved_messages = RecievedMessage.where(user_id: params[:user_id])
          render json: @recieved_messages
    end

    def create
        @recieved_messages = RecievedMessage.create!(recieved_messages_params)
    end

def destroy
  @recieved_messages = current_user.recieved_message.find(params[:id])
  @recieved_messages.destroy
  flash[:notice] = "Removed friendship."
  redirect_to current_user
end
private
def recieved_messages_params
    params.require(:recieved_message).permit(:user_id, :sender_id, :content)
end
end
