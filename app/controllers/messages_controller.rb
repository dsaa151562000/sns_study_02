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
@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)
end

#@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)






   #@mess = @snsstudy.messages.paginate(page: params[:page])
   #posts = Post.where("id = ? and title = ?", 2, 'title')
   #@mess = @snsstudy.messages.where(to_snsstudy_id:2)
   #@mess = current_user.messages.where("to_snsstudy_id = ?",@snsstudy)

   #@mess = current_user.messages.where("to_snsstudy_id = ?",@snsstudy)

   #@mess = Message.find_by_sql("SELECT snsstudies.id,snsstudies. name,messages.id,messages.messe,messages.snsstudy_id,messages.to_snsstudy_id,messages.created_at FROM snsstudies INNER JOIN messages ON snsstudies.id = messages.snsstudy_id WHERE (snsstudy_id = 1 OR snsstudy_id = 2) AND (to_snsstudy_id = 2 OR  to_snsstudy_id = 1) ORDER BY messages.created_at desc")

  # @mess = Message.find_by_sql(["SELECT snsstudies.id,snsstudies. name,messages.id,messages.messe,messages.snsstudy_id,messages.to_snsstudy_id,messages.created_at FROM snsstudies INNER JOIN messages ON snsstudies.id = messages.snsstudy_id WHERE (snsstudy_id = ? OR snsstudy_id = ?) AND (to_snsstudy_id = ? OR  to_snsstudy_id = ?) ORDER BY messages.created_at desc",@c_user,@snsstudy,@snsstudy,@c_user])


  end

  def new

       @message = Message.new

  end

  def create

     @message = Message.new(messages_params)
     @message.save

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
