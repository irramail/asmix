class MediafilesController < ApplicationController
  before_action :authenticate_user!
  def create
    @content = Content.find(params[:content_id])

    params[:mediafile][:file].each do |a|
      @mediafile = @content.mediafiles.create(mediafile_params.merge(:file => a))
    end

    if @mediafile.errors.any?
      render 'contents/show'
    else
      redirect_to content_path(@content)
    end
  end

  def update
    @mediafile = Mediafile.find(params[:id])
    respond_to do |format|
      if @mediafile.update(mediafile_params)
        format.json { render json: @mediafile, status: 200 }
      else
        format.json { render json: {error: @mediafile.errors} }
      end
    end
  end

  def destroy
    @content = Content.find(params[:content_id])
    @mediafile = @content.mediafiles.find(params[:id])
    @mediafile.destroy
    redirect_to content_path(@content)
  end

  private
    def mediafile_params
      params.require(:mediafile).permit(:md5, :filename, :weight, :file => [])
    end
end
