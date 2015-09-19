class Message < ActiveRecord::Base
	belongs_to :snsstudy
	validate :add_error_sample

	def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if messe.empty?
      errors.add(:messe, "に関係するエラーを追加")
      errors[:base] << "モデル全体に関係するエラーを追加"
    end
  end

end
