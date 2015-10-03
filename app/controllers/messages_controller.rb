class MessagesController < ApplicationController

  def index

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

     @message = Message.new(messages_params)
     if  @message.save
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


    private

 
    def messages_params
      #params.require(:snsstudy).permit(:name, :introduction)
      params.require(:message).permit(:messe, :snsstudy_id, :to_snsstudy_id)
    end

end
