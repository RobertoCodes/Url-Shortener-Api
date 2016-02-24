class Api::ShortUrlsController < ApplicationController

  def create
    @short_url = ShortUrl.generate_from_url(params[:url])
    if @short_url.save
      render :show
    else
      render json: @short_url.errors.full_messages
    end
  end



  private
  def handle_url_array(url_array)
    short_urls = []
    url_array.each do |url|
      short_url = ShortenedUrl.generate_from_url(url)
      if short_url.save
        short_urls.push(short_url)
      end
    end
    return short_urls
  end

end
