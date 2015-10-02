require 'rails_helper'

describe Message do
 
  let(:from_message) { FactoryGirl.create(:snsstudy) }
  let(:to_message) { FactoryGirl.create(:snsstudy) }
  let(:message) { from_message.messages.build(snsstudy_id: from_message.id, messe: "aaaaaaaaaa")}
  let(:message02) { from_message.messages.build(snsstudy_id: to_message.id, messe: "bbbbbbbbb")}


    before do
    from_message.save
    to_message.save
    end

   it{expect(message).to be_valid}
   it{expect(message02).to be_valid}

   it "メッセージの空白は無効" do
     maeesage2=from_message.messages.build(snsstudy_id: from_message.id, messe: nil)
     expect(maeesage2).not_to be_valid
   end


# メッセージのやりとりのテスト
   it "is valid with a firstname, lastname and email" do

   @message = Message.new
   mess= @message.mess(from_message.id,to_message.id)
   p mess

end



end







