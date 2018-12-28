class SentMessagesController < ApplicationController
        def index
            @sent_messages = SentMessage.all
            render json: @sent_messages
        end
        def showSentMessages
              @sent_messages = SentMessage.where(user_id: params[:user_id])
              render json: @sent_messages
        end

        def create
            @sent_messages = SentMessage.create!(sent_messages_params)
        end

    def destroy
      @sent_messages = current_user.sent_messages.find(params[:id])
      @sent_messages.destroy
      flash[:notice] = "Removed friendship."
      redirect_to current_user
    end
    private
    def sent_messages_params
        params.require(:sent_message).permit(:user_id, :recipient_id, :recipient_name, :content)
    end

end
