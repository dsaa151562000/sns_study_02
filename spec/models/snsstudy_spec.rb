require 'rails_helper'

#describe Contact do
# 有効なファクトリを持つこと it "has a valid factory" do
#expect(FactoryGirl.build(:snsstudy)).to be_valid 
#end

describe Snsstudy do
 before do
 #newでオブジェクトを生成
   @user = Snsstudy.new(name: "Example User", email: "user@example.com",password: "foobar", password_confirmation: "foobar")
 end
 #ファクトリーガールを使用してオブジェクトを生成
  let(:user) { FactoryGirl.create(:snsstudy) }
#subject itの主題
  subject { user }

 #8つのexample
 #respond_to シンボルを引数として受け取り、そのメソッド（またはメンバ）をオブジェクトが保持している場合はtrueを、そうでない場合はfalseを返す。
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:tsubyakis) }
  it { should respond_to(:relationships) }


#バリデーションテスト-------------------------------------------------------------------
 #9個目のexample
it { is_expected.to validate_presence_of(:name) }
=begin
　describe "nameの空白は無効" do
    　before { 
   　  user.name = " " 
   　 }
    it{ expect(user).not_to be_valid }
    it { should_not be_valid }
  end
=end

 #10個目のexample
it { is_expected.to validate_presence_of(:email) }
=begin
 describe "emailの空白は無効" do
    before { user.email = " " }
    #it { should_not be_valid }
    it{ expect(user).not_to be_valid }
  end
=end

 #11個目のexample
it { is_expected.to ensure_length_of(:name).is_at_most(50) }
=begin
describe "名前は50文字まで" do

    before { user.name = "a" * 51 }
    #it { should_not be_valid }
    it{ expect(user).not_to be_valid }
  end
=end


 #12個目のexample
 it { is_expected.to validate_presence_of(:password) }
=begin
  describe "パスワードの空白は無効" do
  
    #before do
      #@user = Snsstudy.new(name: "Example User", email: "user@example.com", password: " ", password_confirmation: " ")
    #end
      before { user.password = " "}
      #it { should_not be_valid }
      it{ expect(user).not_to be_valid }
  end
=end
 #13個目のexample
  it { is_expected.to validate_presence_of(:password_confirmation) }
=begin
  describe "再確認のパスワードの空白は無効" do
  
    #before do
      #@user = Snsstudy.new(name: "Example User", email: "user@example.com", password: " ", password_confirmation: " ")
    #end
      before { user.password_confirmation= " "}
      it{ expect(user).not_to be_valid }
  end
=end

 #14個目のexample
it "メールアドレスの無効なフォーマット" do
  invalid_emails = %w(
      user@foo,com
      user_at_foo.org
      example.user@foo.
      foo@bar_baz.com
      foo@bar+baz.com
      foo@bar..com
    )
  is_expected.not_to allow_value(*invalid_emails).for(:email)
end

=begin
  describe "メールアドレスの無効なフォーマット" do
    it "should be invalid" do
      #%w 配列を作る。%w[foo bar baz] => ["foo", "bar", "baz"] 配列の要素はスペース区切りで指定する。
      #無効なフォーマット
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      #eachで配列の各要素をinvalid_addressへ
      addresses.each do |invalid_address|
        #@userのemailに格納
        user.email = invalid_address
        #@userは無効になる
        expect(user).not_to be_valid
      end
    end
  end
=end

 #15個目のexample
it { is_expected.to validate_uniqueness_of(:email) }
=begin
  describe "メールアドレスはユニークでなければならない" do
    before do
       # @user = Snsstudy.new(name: "Example User", email: "user@example.com",password: "foobar", password_confirmation: "foobar")
      #dupメソッドは、レシーバのオブジェクトのコピーを作成して返します。
      #user_with_same_email = @user.dup
      #user_with_same_email.save
      user_with_same_email = user.dup
      user_with_same_email.save

    #it { should_not be_valid }
    it{ expect(user).not_to be_valid }
    end

  end
=end

#16個目のexample
describe "記憶トークンが有効である (空欄のない)" do
    before { 
      @user = Snsstudy.new(name: "Example User", email: "user@example.com",password: "foobar", password_confirmation: "foobar")
      @user.save }

    it { expect(@user.remember_token).not_to be_blank }

  end


#つぶやきに関するテスト-------------------------------------------------------------------


describe "tubuyakiの連携" do
    before { @user.save }  
   #ファクトリーガールでつぶやきオブジェクトを生成
   #let!とは example の実行前に let! で定義した値が作られるようになる。
   #let ではuser.tsubyakis が nil を返してしまい、テストが失敗する。nil と [newer_tsubyaki, older_tsubyaki]を比較しようとした瞬間にレコードがデータベースに保存されます）
   let!(:older_tsubyaki) do
      FactoryGirl.create(:tsubyaki, snsstudy: @user, created_at: 1.day.ago)
    end
    let!(:newer_tsubyaki) do
      FactoryGirl.create(:tsubyaki, snsstudy: @user, created_at: 1.hour.ago)
    end
   

    #17個目のexample
    it "作成された日時で昇順になっているか" do
      expect(@user.tsubyakis.to_a).to eq [newer_tsubyaki, older_tsubyaki]
    end
     #it { should be_valid }
     #18個目のexample
     #it "作成された日時で昇順になっているか" do
     #tsubyakis = @user.tsubyakis.to_a
     #@user.destroy
     #end

    #18個目のexample
    it "snstudyのユーザーが削除されたらtsubyakiも削除される" do
      tsubyakis = @user.tsubyakis.to_a #to_a メソッドでつぶやきのコピーが作成されている
      @user.destroy #ユーザーを削除

      expect(tsubyakis).not_to be_empty #to_aメソッドを付け忘れたときのエラーをすべてキャッチ
      tsubyakis.each do |tsubyaki|
        expect(Tsubyaki.where(id: tsubyaki.id)).to be_empty #ユーザーが削除されているのでつぶやきは空である
      end
    end
     
     describe "つぶやきに含まれるモノ" do
      #ファクトリーでさらにユーザーオブジェクトと連携するつぶやきオブジェクトを生成　letで定義されたunfollowed_postへ
      let(:unfollowed_post) do
        FactoryGirl.create(:tsubyaki, snsstudy: FactoryGirl.create(:snsstudy))
      end

      #19個目のexample
      it "tsubyaki_matomeは1日前の自分のつぶやきを含む" do
       expect(@user.tsubyaki_matome).to include(older_tsubyaki)
      end

      #20個目のexample
      it "tsubyaki_matomeは1時間前の自分のつぶやきを含む" do
       expect(@user.tsubyaki_matome).to include(newer_tsubyaki)
      end

      #21個目のexample
      it "tsubyaki_matomeはフォローしていないユーザーのつぶやきを含まない" do
       expect(@user.tsubyaki_matome).not_to include(unfollowed_post)
      end

     end

      


  end



  
end
