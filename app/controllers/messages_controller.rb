class MessagesController < ApplicationController

  def index #メッセージを一覧表示してくれてメッセージの入力を担うアクション
    @message = Message.new
    #@messages = @group.messages.includes(:user)
  end

  def create #メッセージの保存ができるアクション
    ＠message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
  
    else
      
    end
  

  end
end
