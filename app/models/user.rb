class User < ActiveRecord::Base

 #before_create :create_remember_token
  
  #outh認証(User)はユーザー(snsstudy)を１つ持つ
  has_one :snsstudy, dependent: :destroy

  #has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :validatable, :omniauthable


  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

#p "----------authの値を出力---------"
#p auth
#p "----------authの値を出力---------"

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        #email:    auth.email,
        email:   auth.info.email,
        #email:    User.dummy_email(auth),
        #password_digest: Devise.friendly_token[0, 20],
        introduction: User.introduction(auth),
        remember_token:User.pass(auth),
        password:User.pass(auth), 
        password_confirmation:User.pass(auth)
      )


    end

    user
  end


  #SecureRandomで衝突しないユニークな文字列を生成する
 def User.new_remember_token
    SecureRandom.urlsafe_base64
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
