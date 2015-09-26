require 'rails_helper'

describe "つぶやき" do

 let(:user) { FactoryGirl.create(:snsstudy) }

 before do
  @tsubyaki = Tsubyaki.new(content: "test_test", snsstudy_id: user.id)
 end

 #主題はつぶやき
 subject { @tsubyaki }


 it { should be_valid } #tsubyakiオブジェクトの生成が成功

 it { should respond_to(:content) }     #tsubyakiオブジェクトはメソッドcontentが定義されている
 it { should respond_to(:snsstudy_id) } #tsubyakiオブジェクトはメソッドsnsstudy_idが定義されている

 it { is_expected.to validate_presence_of(:content) }      #contentの空白は無効
 it { is_expected.to validate_presence_of(:snsstudy_id) }  #snsstudy_idの空白は無効


end



