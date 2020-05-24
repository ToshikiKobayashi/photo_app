class OauthCertifiersController < ApplicationController
  # OAuth�F��
  def index
    # OAuth�F�؏��擾
    authinfo = OauthCertifier.find_by(userid: current_user.userid)
    # OAuth�F�ؗp�̃����NURL�쐬
    uri = URI("https://arcane-ravine-29792.herokuapp.com/oauth/authorize")
    uri.query = {
      response_type: 'code',
      client_id: authinfo.client_id,
      redirect_uri: 'http://localhost:3000/oauth/callback'
    }.to_param
    
    redirect_to uri.to_s
  end

  # OAuth�F�،�Ɏ��s�����R�[���o�b�N
  def callback
  
    # �F�،�ɓn�����F�R�[�h�擾
    code = params[:code]
    
    # �F�؏��擾
    authinfo = OauthCertifier.find_by(userid: current_user.userid)
    
    # �A�N�Z�X�g�[�N���擾�̂��߂̃��b�Z�[�W���M
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
    
    # �A�N�Z�X�g�[�N���擾
    set_token(result["access_token"])
    
    # ���[�gURL�Ƀ��_�C���N�g
    redirect_to root_path
  end
end
