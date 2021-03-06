class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @clients = Client.all
  end

  def new
    @message = Message.new
    @clients = Client.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to messages_path
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to messages_path(@message)
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:body, :to, :from, :media_url)
  end
end
