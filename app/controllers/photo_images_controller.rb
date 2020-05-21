class PhotoImagesController < ApplicationController
  before_action :logged_in_user, only:[:index, :create, :new]

  # 写真一覧表示画面
  def index
   @image = PhotoImage.all
  end

  # 写真アップロード処理(DBおよびファイル保存)
  def create
    @image = PhotoImage.new
    # 写真の名前だけをDBに保存しておく
    @image.filename = params[:photo_image][:filename]
    
    img = params[:photo_image][:image]
    unless img.present? then
      @errmng = "Please enter the image file"
    end
    
    if @image.valid? && @image.save then
      # データはファイル保存
      data = params[:photo_image][:image].read
      File.binwrite('app/assets/images/' + @image.filename, data)
    
      redirect_to photo_images_url
    else
      render 'new'
    end
  end

  # 写真アップロード画面
  def new
    @image = PhotoImage.new
  end
end
