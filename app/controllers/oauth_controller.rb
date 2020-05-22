class OauthController < ApplicationController
  def callback
    code = params[:code]
    
    uri = URI.parse("https://arcane-ravine-29792.herokuapp.com/oauth/token")
    params = {
       code: code,
       client_id: "2058029af1b023a3f157b40e065d97c1b32ac76ce99a15d7dfbb5fa16f96fbc0",
       client_secret: "12b6dd20a34790daa56fca013d16b62fef400914e377bab02a0be6407cfbf87c",
       redirect_uri: "http://localhost:3000/oauth/callback",
       grant_type: "authorization_code"
    }
    response = Net::HTTP.post_form(uri, params)
    result = JSON.parse(response.body)
    set_token(result["access_token"])
    
    redirect_to root_path
  end
end
