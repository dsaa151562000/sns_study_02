class Message < ActiveRecord::Base
	belongs_to :snsstudy
	validates :messe, presence: {message: "メッセージを入力してください"}

   def mess(a,b)
    #Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', @snsstudy,@c_user).where('snsstudies.id  IN (?,?)', @c_user,@snsstudy).order(:created_at).references(:snsstudy)
    Message.includes(:snsstudy).where('snsstudies.id  IN (?,?)', a,b).where('snsstudies.id  IN (?,?)', b,a).order(:created_at).references(:snsstudy)
   end

  
end
