require 'rails_helper'

describe Message do
 
  let(:from_message) { FactoryGirl.create(:snsstudy) }
  let(:to_message) { FactoryGirl.create(:snsstudy) }
  let(:message) { from_message.messages.build(snsstudy_id: from_message.id, messe: "aaaaaaaaaa")}

   it{expect(message).to be_valid}
  
   it "メッセージの空白は無効" do
     maeesage2=from_message.messages.build(snsstudy_id: from_message.id, messe: nil)
     expect(maeesage2).not_to be_valid
   end

end







