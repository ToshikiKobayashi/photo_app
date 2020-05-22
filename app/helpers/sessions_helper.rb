module SessionsHelper
  # �n���ꂽ���[�U�[�Ń��O�C������
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # ���݃��O�C�����̃��[�U�[��Ԃ� (����ꍇ)
  def current_user
    if session[:user_id]
      @current_user = @current_user || User.find_by(id: session[:user_id])
    end
  end
  
  #�󂯎�������[�U�[�����O�C�����̃��[�U�[�ƈ�v�����true��Ԃ�
  def current_user?(user)
    user == current_user
  end

  # ���[�U�[�����O�C�����Ă����true�A���̑��Ȃ�false��Ԃ�
  def logged_in?
    !current_user.nil?
  end

  # ���݂̃��[�U�[�����O�A�E�g����
  def log_out
    session.delete(:token)
    session.delete(:user_id)
    @current_user = nil
  end
end
