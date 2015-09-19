require 'rails_helper'

describe Snsstudy do

 before do
  #7つのテスト。
  #newでオブジェクトを生成
   @user = Snsstudy.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
 end

#subject itの主題
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


#バリデーションテスト-------------------------------------------------------------------
 #8個目のテスト。
describe "nameの空白は無効" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

 #9個目のテスト。
describe "emailの空白は無効" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

 #10個目のテスト。
describe "名前は50文字まで" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

 #11個目のテスト。
  describe "パスワードの空白は無効" do
    before do
      @user = Snsstudy.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

 #12個目のテスト。
  describe "when email format is invalid" do
    it "should be invalid" do
      #%w 配列を作る。%w[foo bar baz] => ["foo", "bar", "baz"] 配列の要素はスペース区切りで指定する。
      #無効なフォーマット
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      #eachで配列の各要素をinvalid_addressへ
      addresses.each do |invalid_address|
        #@userのemailに格納
        @user.email = invalid_address
        #@userは無効になる
        expect(@user).not_to be_valid
      end
    end
  end
  
end
