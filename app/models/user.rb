class User < ActiveRecord::Base

 before_create :create_remember_token
  
  #outh認証(User)はユーザー(snsstudy)を１つ持つ
  has_one :snsstudy, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :validatable, :omniauthable


  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

p "----------authの値を出力---------"
p auth.info.name
p "----------authの値を出力---------"

    unless user
      @mail="aaaa.@test.com"
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        #email:    auth.email,
        email:   @mail,
        #email:    User.dummy_email(auth),
        #password_digest: Devise.friendly_token[0, 20],
        introduction: User.introduction(auth),
        #remember_token:User.remember_token,
        #encrypted_password:pass(auth)
        password:User.pass(auth), 
        password_confirmation:User.pass(auth)

        #password_digest: User.password_digest("dsadasasdasd")
      )


    end

    user
  end


  #SecureRandomで衝突しないユニークな文字列を生成する
 def User.new_remember_token
    SecureRandom.urlsafe_base64
 end

 #生成した文字列をSHA1で暗号化
 def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
 end


  #=======================================unless user　テスト用メソッド
  private

   def self.dummy_email(auth)
     "#{auth.uid}-#{auth.provider}@example.com"
   end

   def self.introduction(auth)
     "#{auth.uid}-#{auth.provider}@example.com"
   end

   def self.pass(auth)
     "dwdqwqwqwedwefewfwefewfewfefe"
   end

   def self.pass2(auth)
     "$2a$10$d7xyamX2bnHYEbbr13jBGe1JRz0j58z3g39DfUoa5wiZCXDzyuehi"
   end



  #=======================================unless user　テスト用メソッド


   def create_remember_token
     self.remember_token = User.encrypt(User.new_remember_token)
   end
end
