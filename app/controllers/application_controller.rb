class ApplicationController < ActionController::Base
  include OauthHelper
  include SessionsHelper

  private
   # ���O�C���ς݃��[�U�[���ǂ����m�F
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
