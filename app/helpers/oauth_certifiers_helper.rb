module OauthCertifiersHelper
  # �A�N�Z�X�g�[�N���ێ�
  def set_token(token)
    session[:token] = token
  end

  # �A�N�Z�X�g�[�N���擾
  def get_token
    @get_token = session[:token]
  end
end
