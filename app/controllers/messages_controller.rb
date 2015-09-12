class MessagesController < ApplicationController

  def index

  end

  def show
   @snsstudy = Snsstudy.find(params[:id])
   @c_user=current_user
#@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)

if @snsstudy == @c_user then

redirect_to(snsstudies_url) 
else
@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)
end

#@mess = Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)









  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
