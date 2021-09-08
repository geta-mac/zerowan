class ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def create
      # ChatRoomUser.where(user_id: current_user.id)で中間テーブルであるchat_room_usersテーブルから、
      # user_idが自分のレコードを取得
    current_user_chat_rooms = ChatRoomUser.where(
      user_id: current_user.id
    ).map(&:chat_room)

      # ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id])で、
      # 「自分がいるチャットルームでかつ、マッチング一覧ページからクリックしたユーザーがいるチャットルーム」を取得
    chat_room = ChatRoomUser.where(
      chat_room: current_user_chat_rooms, 
      user_id: params[:user_id]
    ).map(&:chat_room).first

    if chat_room.blank?
      chat_room = ChatRoom.create
      ChatRoomUser.create(chat_room: chat_room, user_id: current_user.id)
      ChatRoomUser.create(chat_room: chat_room, user_id: params[:user_id])
    end
    redirect_to action: :show, id: chat_room.id
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
      # @chat_roomにいる自分でないユーザー(自分とマッチングしたユーザー)の情報を取得
    @chat_room_user = @chat_room.chat_room_users.where.not(user_id: current_user.id).first.user
      #アクセスしたチャットルーム(@chat_room)のチャットメッセージを取得
    @chat_messages = ChatMessage.where(chat_room: @chat_room)
  end
end
