class MessagesController < ApplicationController
  before_action :set_line,:set_station

  def index 
    @message = Message.new
    @messages =Message.where(line_id:params[:line_id],station_id:params[:station_id])
  end

  def create
    @message = Message.new(message_params)
    @message.line_id=@line.id
    @message.station_id=@station.id
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      @messages = @station.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_line
    @line = Line.find(params[:line_id])
  end

  def set_station
    @station = Station.find(params[:station_id])
  end
end
