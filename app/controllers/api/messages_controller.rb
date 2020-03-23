class Api::MessagesController < ApplicationController
  def index
    # ajaxで送られてくる最後のメッセージのid番号を変数に代入
    last_message_id = params[:id].to_i
    # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
    @messages =Message.where(line_id:params[:line_id],station_id:params[:station_id]).includes(:user).where("id > ?", last_message_id)
  end
end