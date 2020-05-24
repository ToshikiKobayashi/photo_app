module OauthCertifiersHelper
  # アクセストークン保持
  def set_token(token)
    session[:token] = token
  end

  # アクセストークン取得
  def get_token
    @get_token = session[:token]
  end
end
