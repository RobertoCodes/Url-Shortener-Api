class Api::ShortUrlsController < ApplicationController

  def create
    @short_url = ShortUrl.generate_from_url(params[:url])
    if @short_url.save
      render :show_no_count
    else
      render json: @short_url.errors.full_messages
    end
  end

end
