require 'rails_helper'

describe Snsstudy do

 before do
  #7つのテスト。newでオブジェクトを生成
   @user = Snsstudy.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
 end

  subject { @user }

 
 #respond_to シンボルを引数として受け取り、そのメソッド（またはメンバ）をオブジェクトが保持している場合はtrueを、そうでない場合はfalseを返す。
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }

#名,メール,pass,remember_tokenがあれば有効な状態であること
 it { should be_valid }


 #8個目のテスト。
describe "nameの空白は無効" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  

  
end
