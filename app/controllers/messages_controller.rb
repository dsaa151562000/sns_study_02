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

@snsstudy_id = [@snsstudy.id,@c_user.id]



@to_snsstudy_id = [@snsstudy.id,@c_user.id]

#@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)


  end

  def new

  end

  def create

    @message = Message.new(messages_params)



     if  @message.save
      
      flash[:success] = 'success!'
     #redirect_to :back
     redirect_to :back
      else
      flash[:error] = 'error!'
      redirect_to :back
      end

  end

  def edit

  end

  def update

  end

  def destroy

  end

    def messages_params
      #params.require(:snsstudy).permit(:name, :introduction)
      params.require(:message).permit(:messe, :snsstudy_id, :to_snsstudy_id)
    end
end
