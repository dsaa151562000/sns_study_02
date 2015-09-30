require 'rails_helper'


describe Snsstudy do
  #before do
   #newでオブジェクトを生成
   #@user = Snsstudy.new(name: "Example User", email: "user@example.com",password: "foobar", password_confirmation: "foobar")
  #end

  #ファクトリーガールを使用してオブジェクトを生成
  let(:user) { FactoryGirl.create(:snsstudy) }

  #subject itの主題
  #subject { user }

 #9つのexample
 #respond_to シンボルを引数として受け取り、そのメソッド（またはメンバ）をオブジェクトが保持している場合はtrueを、そうでない場合はfalseを返す。
  it{ expect(user).to respond_to(:name) }
  it{ expect(user).to respond_to(:email) }
  it{ expect(user).to respond_to(:password_digest) }
  it{ expect(user).to respond_to(:password) }
  it{ expect(user).to respond_to(:password_confirmation) }
  it{ expect(user).to respond_to(:remember_token) }
  it{ expect(user).to respond_to(:tsubyakis) }
  it{ expect(user).to respond_to(:relationships) }
  it{ expect(user).to respond_to(:followed_users) }



#バリデーションテスト-------------------------------------------------------------------
 #10個目のexample
 it "nameの空白は無効" do
   user3 = FactoryGirl.build(:snsstudy, name: nil)
   expect(user3).not_to be_valid
 end

 #11個目のexample
 it "nameの51文字以上の入力は無効" do
   user3 = FactoryGirl.build(:snsstudy, name: "a"*51)
   expect(user3).not_to be_valid
 end

 #12個目のexample
 it "emailの空白は無効" do
   user3 = FactoryGirl.build(:snsstudy, email: nil)
   expect(user3).not_to be_valid
 end

 #13個目のexample
 it "passwordの空白は無効" do
   user3 = FactoryGirl.build(:snsstudy, password: nil)
   expect(user3).not_to be_valid
 end

 #14個目のexample
 it "passwordの空白は無効" do
   user3 = FactoryGirl.build(:snsstudy, password_confirmation: nil)
   expect(user3).not_to be_valid
 end

 #15個目のexample   shoulda-matchersによるallow_value
 it "invalid emails" do
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

 #16個目のexample
it "password_confirmationの空白は無効" do
  user3 = FactoryGirl.build(:snsstudy, password_confirmation: nil)
  expect(user3).not_to be_valid
 end


#17個目のexample
 describe "記憶トークンが有効である (空欄のない)" do
    let(:user) { FactoryGirl.create(:snsstudy) }
    before { user.save }
    it { expect(user.remember_token).not_to be_blank }
  end


#つぶやきに関するテスト-------------------------------------------------------------------
 describe "tubuyakiの連携のテスト" do
  let(:user) { FactoryGirl.create(:snsstudy) }
  before { user.save }
   #ファクトリーガールでつぶやきオブジェクトを生成
   #let!とは example の実行前に let! で定義した値が作られるようになる。
   #let ではuser.tsubyakis が nil を返してしまい、テストが失敗する。nil と [newer_tsubyaki, older_tsubyaki]を比較しようとした瞬間にレコードがデータベースに保存されます）
  let!(:older_tsubyaki) do
    FactoryGirl.create(:tsubyaki, snsstudy: user, created_at: 1.day.ago)
  end

  let!(:newer_tsubyaki) do
    FactoryGirl.create(:tsubyaki, snsstudy: user, created_at: 1.hour.ago)
  end
   

  #18個目のexample
  it "作成された日時で昇順になっているか" do
    expect(user.tsubyakis.to_a).to eq [newer_tsubyaki, older_tsubyaki]
  end


  #19個目のexample
  it "snstudyのユーザーが削除されたらtsubyakiも削除される" do
    tsubyakis = user.tsubyakis.to_a #to_a メソッドでつぶやきのコピーが作成されている
    user.destroy #ユーザーを削除
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

    #20個目のexample
    it "tsubyaki_matomeは1日前の自分のつぶやきを含む" do
      expect(user.tsubyaki_matome).to include(older_tsubyaki)
    end

    #21個目のexample
    it "tsubyaki_matomeは1時間前の自分のつぶやきを含む" do
      expect(user.tsubyaki_matome).to include(newer_tsubyaki)
    end

    #22個目のexample
    it "tsubyaki_matomeはフォローしていないユーザーのつぶやきを含まない" do
      expect(user.tsubyaki_matome).not_to include(unfollowed_post)
      end
    end

 end


 #フォローに関するテスト==================================================
 describe "フォローについてのテスト" do
   let(:user) { FactoryGirl.create(:snsstudy) }
   before { user.save }

     #23個目のexample  userオブジェクト にメソッド following?が定義されている
     it{ expect(user).to respond_to(:following?) }

     #24個目のexample  userオブジェクト にメソッド ffollow!が定義されている
     it{ expect(user).to respond_to(:follow!) }   #

    describe "following" do
      let(:other_user) { FactoryGirl.create(:snsstudy) }#ファクトリーでユーザーオブジェクトを生成
      before do
        user.follow!(other_user) #userからrelationshipsオブジェクトを生成しDBへ保存
      end

     #25個目のexample
      it{ expect(user).to respond_to(:followed_users) }

     #26個目のexample
      it"follow!で他のユーザーをフォローする"do
        #user.followed_users.should include(other_user)  #followed_usersにはother_userが含まれる
        expect(user.followed_users).to include(other_user)
      end

     #27個目のexample
      it"other_userのフォロワーにはuserが含まれる"do  #other_user.followersにはuserが含まれる
        expect(other_user.followers).to include(user)
      end

   end

    describe "フォーローしているユーザーの「つぶやき」と自分の「つぶやき」がまとめて含まれる" do

      let(:unfollowed_tsubuyaki) do
         #ファクトリーでつぶやきオブジェクトを生成　unfollowed_tsubuyakiに定義
         FactoryGirl.create(:tsubyaki, snsstudy: FactoryGirl.create(:snsstudy))
      end

      #ファクトリーでsnsstudyオブジェクトを生成　followed_userに定義
      let(:followed_user) { FactoryGirl.create(:snsstudy) }
      before do
         user.follow!(followed_user) #followed_userをフォロー
         3.times { followed_user.tsubyakis.create!(content: "つぶやき") } #followed_userが3回つぶやく
      end

      #28個目のexample
      it"tsubyaki_matomeには自分のつぶやきとフォロワーのつぶやきが含まれる"do
        #p user.tsubyaki_matome
        followed_user.tsubyakis.each do |tsubyaki|
          #user.tsubyaki_matome.should include(tsubyaki)
          expect(user.tsubyaki_matome).to include(tsubyaki)
        end
     end

    end

 end

end
