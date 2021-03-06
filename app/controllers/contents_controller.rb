class ContentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
    if params[:contents_search].present?
      @mediafiles = @content.mediafiles.search(params[:contents_search])
    else
      @mediafiles = @content.mediafiles.search(params[:contents_search]).page params[:page]
    end
    @device_id = params[:device_id]
    if @device_id.present?
      @mediafiles.clear
      @content.mediafiles.each { |x| x.tasks.where(device_id: params[:device_id]).each {|t| @mediafiles << t.mediafile }}
    end
  end

  def new
    @content = Content.new
  end

  def edit
    @content = Content.find(params[:id])
  end

  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to @content
    else
      render 'new'
    end
  end

  def gen
    #FIXME i18n title
    Content.create!(title: "Background music")
    Content.create!(title: "Adware music")
    Content.create!(title: "Background video")
    Content.create!(title: "Adware video")
    Content.create!(title: "Background image")
    Content.create!(title: "Adware image")

    redirect_to contents_path
  end

  def update
    @content = Content.find(params[:id])

    if @content.update(content_params)
      redirect_to @content
    else
      render 'edit'
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    redirect_to contents_path
  end

  private
    def content_params
      params.require(:content).permit(:title, :device_id)
    end
end
