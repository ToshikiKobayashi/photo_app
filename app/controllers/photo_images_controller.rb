class PhotoImagesController < ApplicationController
  before_action :logged_in_user, only:[:index, :create, :new, :upload]

  # 写真一覧表示画面
  def index
   @image = PhotoImage.all
   # OAuth認証用のリンクURL作成
   @uri = URI("https://arcane-ravine-29792.herokuapp.com/oauth/authorize")
   @uri.query = {
      response_type: 'code',
      client_id: '2058029af1b023a3f157b40e065d97c1b32ac76ce99a15d7dfbb5fa16f96fbc0',
      redirect_uri: 'http://localhost:3000/oauth/callback'
   }.to_param
  end

  # 写真アップロード処理(DBおよびファイル保存)
  def create
    @image = PhotoImage.new
    # 写真のタイトルと名前をDBに保存しておく
    @image.title = params[:photo_image][:title]
    img = params[:photo_image][:image]
    unless img.present? then
      @errmng = "画像ファイルを入力してください"
    else
      @image.filename = img.original_filename
    end

    if @image.valid? && @image.save then
      # データはファイル保存
      data = params[:photo_image][:image].read
      File.binwrite('public/photo/' + @image.filename, data)
    
      redirect_to root_path
    else
      render 'new'
    end
  end

  # 写真アップロード画面
  def new
    @image = PhotoImage.new
  end
  
  # MyTwetterアップロード
  def upload
    token = session[:token]
    title = params[:photo_image][:title]
    filename = params[:photo_image][:filename]
  
    uri = URI.parse("https://arcane-ravine-29792.herokuapp.com/api/tweets")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"
    
    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer " + token
    }
    params = {
      text: title,
      url: "http://localhost:3000/photo/" + filename
    }
    response = http.post(uri.path, params.to_json, headers)
    if response.code == "201" then
      flash[:notice] = "MyTwetterへの送信に成功しました。"
      redirect_to root_path
    else
      flash[:alert] = "MyTwetterへの送信に失敗しました。(" + response.code + ")"
      redirect_to root_path
    end
  end
end
