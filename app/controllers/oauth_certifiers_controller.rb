class OauthCertifiersController < ApplicationController
  # OAuth認証
  def index
    # OAuth認証情報取得
    authinfo = OauthCertifier.find_by(userid: current_user.userid)
    # OAuth認証用のリンクURL作成
    uri = URI("https://arcane-ravine-29792.herokuapp.com/oauth/authorize")
    uri.query = {
      response_type: 'code',
      client_id: authinfo.client_id,
      redirect_uri: 'http://localhost:3000/oauth/callback'
    }.to_param
    
    redirect_to uri.to_s
  end

  # OAuth認証後に実行されるコールバック
  def callback
  
    # 認証後に渡される認可コード取得
    code = params[:code]
    
    # 認証情報取得
    authinfo = OauthCertifier.find_by(userid: current_user.userid)
    
    # アクセストークン取得のためのメッセージ送信
    uri = URI.parse("https://arcane-ravine-29792.herokuapp.com/oauth/token")
    params = {
       code: code,
       client_id: authinfo.client_id,
       client_secret: authinfo.client_secret,
       redirect_uri: authinfo.redirect_uri,
       grant_type: "authorization_code"
    }
    response = Net::HTTP.post_form(uri, params)
    result = JSON.parse(response.body)
    
    # アクセストークン取得
    set_token(result["access_token"])
    
    # ルートURLにリダイレクト
    redirect_to root_path
  end
end
