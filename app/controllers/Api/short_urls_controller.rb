class Api::ShortUrlsController < ApplicationController

  def create
    @short_url = ShortUrl.generate_from_long_url(params[:url])
    if @short_url.save
      render json: @short_url
    else
      render json: @short_url.errors.full_messages
    end
  end





end
