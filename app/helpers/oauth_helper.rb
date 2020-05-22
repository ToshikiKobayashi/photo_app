module OauthHelper
  def set_token(token)
    session[:token] = token
  end
  
  def get_token
    @get_token = session[:token]
  end
end
