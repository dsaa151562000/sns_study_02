class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  def twitter
    callback_from :twitter
  end

  private

  def callback_from(provider)
  	#配列を文字列に変換
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])




    #persisted?メソッドについて.persisted?は、レシーバがデータベースに保存済みかどうかを確認する。
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)

      #@snsstudy = Snsstudy.new(snsstudy_params)
      sign_in_and_redirect @user, event: :authentication
              #sign_in(user)　引数に現在の@snsstudy  新しいユーザーを作成したらセッションも作成
        
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end