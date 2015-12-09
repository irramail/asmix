class MediafilesController < ApplicationController
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

  def destroy
    @content = Content.find(params[:content_id])
    @mediafile = @content.mediafiles.find(params[:id])
    @mediafile.destroy
    redirect_to content_path(@content)
  end

  private
    def mediafile_params
      params.require(:mediafile).permit(:file => [])
    end
end
