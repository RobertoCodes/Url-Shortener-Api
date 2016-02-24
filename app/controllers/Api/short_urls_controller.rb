class Api::ShortUrlsController < ApplicationController

  def create
    if params[:url].is_a?(Array)
      @short_urls = handle_url_array(params[:url])
      render :show_array
    else
      @short_url = ShortUrl.generate_from_url(params[:url])
      if @short_url.save
        render :show_no_count
      else
        render json: @short_url.errors.full_messages
      end
    end
  end

  def show
    @short_url = ShortUrl.find(params[:id])
    if @short_url
      render :show_with_count
    else
      render json: @short_url.errors.full_messages
    end
  end

  def redirect
    url_obj = ShortUrl.find_by_short(params[:short])
    redirect_to url_obj.url
    ShortUrl.increment_counter(:visit_count, url_obj.id)
  end

private
def handle_url_array(url_array)
  short_urls = []
  url_array.each do |url|
    short_url = ShortUrl.generate_from_url(url)
    if short_url.save
      short_urls.push(short_url)
    end
  end
  return short_urls
end

end
