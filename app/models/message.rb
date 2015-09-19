class Message < ActiveRecord::Base
	belongs_to :snsstudy
<<<<<<< HEAD
	validate :add_error_sample

	def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if messe.empty?
      errors.add(:messe, "に関係するエラーを追加")
      errors[:base] << "モデル全体に関係するエラーを追加"
    end
  end

=======
<<<<<<< HEAD

	validates :messe, presence: {message: "メッセージを入力してください"}
=======
>>>>>>> 8481cb1a9cd71a4da2e589a4e2ea44dd44b348bf
>>>>>>> f0a226a5f0d7598e558e6e26d59670cc94d14d32
end
