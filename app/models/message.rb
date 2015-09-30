class Message < ActiveRecord::Base
	belongs_to :snsstudy
	validates :messe, presence: {message: "メッセージを入力してください"}

   def mess
    #Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)
    Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', 1,2).where('snsstudies.id  IN (?,?)', 2,1).order(:created_at).references(:snsstudy)
   end

  
end
