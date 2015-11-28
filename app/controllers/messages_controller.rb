class MessagesController < ApplicationController

  def index
sasafffffffffff
  end

  def show

       @message = Message.new
       @snsstudy = Snsstudy.find(params[:id])
       @c_user=current_user
       #@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)

       if @snsstudy == @c_user then
         redirect_to(snsstudies_url) 
       else
         #@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)
         #@mess= @message.mess(@snsstudy,@c_user)
         @mess= Message.mess(@snsstudy,@c_user)
       end

         @snsstudy_id = [@snsstudy.id,@c_user.id]
         @to_snsstudy_id = [@snsstudy.id,@c_user.id]
         #@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)
  end

  def new
       @message = Message.new
  end

  def create
        #パラメーターを取得、@messageへ格納
        @message = Message.new(messages_params)
        #@snsstudy=Snsstudy.new

        @send_message=current_user.send_message(@message.to_snsstudy_id, @message.messe)

        #Snsstudyモデルからsend_messageメソッドを呼び出し  引数に3つ　1,to_snsstudy_id　2,snsstudy_id　3,messe
        #@send_message=@snsstudy.send_message(@message.to_snsstudy_id , @message.snsstudy_id , @message.messe)

        #if  @message.save && @test
        if @send_message
         flash[:success] = "メッセージを投稿しました"
         redirect_to :back 
        else
         flash[:error] = "メッセージを投稿してください"
         redirect_to :back 
        end
   end



  def edit

  end

  def update

  end

  def destroy

  end

  def find_snsstudy_id
        user = Snsstudy.find(params[:snsstudy_id])  # "1"はidのことで、idで検索する
        users = Snsstudy.find(params[:to_snsstudy_id])  # "1"はidのことで、idで検索する

        unless !user or !users 
          redirect_to signin_url, notice: "ユーザーが存在しません！！"
        end
  end


    private

 
    def messages_params
         #params.require(:snsstudy).permit(:name, :introduction)
         params.require(:message).permit(:messe, :snsstudy_id, :to_snsstudy_id)
    end

end
