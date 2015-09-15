class Message < ActiveRecord::Base
	belongs_to :snsstudy

	validates :messe, presence: {message: "メッセージを入力してください"}
end
