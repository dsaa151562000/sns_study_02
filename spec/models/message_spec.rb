require 'rails_helper'

describe Message do
 
  let(:from_message) { FactoryGirl.create(:snsstudy) }
  let(:to_message) { FactoryGirl.create(:snsstudy) }
  let(:other_message) { FactoryGirl.create(:snsstudy) }
  let(:message) { from_message.messages.build(to_snsstudy_id: to_message.id, messe: "aaaaaaaaaa")}
  let(:message02) { to_message.messages.build(to_snsstudy_id: from_message.id, messe: "bbbbbbbbb")}
  let(:message03) { from_message.messages.build(to_snsstudy_id: other_message.id, messe: "ccccccccc")}


  before do
     from_message.save
     to_message.save
     other_message.save
     #message.save
     #message02.save
  end

 it{expect(message).to be_valid}
 it{expect(message02).to be_valid}
 it{expect(message03).to be_valid}

 it "メッセージの空白は無効" do
     maeesage2=from_message.messages.build(snsstudy_id: from_message.id, messe: nil)
     expect(maeesage2).not_to be_valid
   end

 describe "メッセージのやり取りの確認" do
   before do
       message.save
       message02.save
       message03.save
   end

    it "messメソッドにはmessageが含まれる" do
       mess= Message.mess(from_message.id,to_message.id) 
       expect(mess).to include(message)
    end

    it "messメソッドにはmessage02が含まれる" do
       mess= Message.mess(from_message.id,to_message.id)
       expect(mess).to include(message02)
    end

    it "messメソッドにはmessage03は含まれない" do
       mess= Message.mess(from_message.id,to_message.id)
       expect(mess).not_to include(message03)
    end
 end
end







