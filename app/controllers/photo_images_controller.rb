class PhotoImagesController < ApplicationController
  before_action :logged_in_user, only:[:index, :create, :new]

  # �ʐ^�ꗗ�\�����
  def index
   @image = PhotoImage.all
  end

  # �ʐ^�A�b�v���[�h����(DB����уt�@�C���ۑ�)
  def create
    @image = PhotoImage.new
    # �ʐ^�̖��O������DB�ɕۑ����Ă���
    @image.filename = params[:photo_image][:filename]
    
    img = params[:photo_image][:image]
    unless img.present? then
      @errmng = "Please enter the image file"
    end
    
    if @image.valid? && @image.save then
      # �f�[�^�̓t�@�C���ۑ�
      data = params[:photo_image][:image].read
      File.binwrite('app/assets/images/' + @image.filename, data)
    
      redirect_to photo_images_url
    else
      render 'new'
    end
  end

  # �ʐ^�A�b�v���[�h���
  def new
    @image = PhotoImage.new
  end
end
