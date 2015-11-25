class ShortUrlsController < ApplicationController
  def index
    @short_urls = ShortUrl.all
  end

  def show
    @short_url = ShortUrl.find(params[:id])
  end

  def new
    @short_url = ShortUrl.new
  end

  def create

    @shortly = ShortUrl.new(short_params)
    # field :is_visible, type: Integer, default: 1
    #field :original_url, type: String
    #field :shorten_url, type: String
    #field :index, type: String

    index = Time.now.to_i
    shorten_url = ShortenUrl.encode_url(index)
    @shortly.shorten_url = shorten_url
    @shortly.index = index

    if false &&  @short_url.save
      redirect_to @short_url, :notice => "Successfully created short url."
    else
      render :action => 'new'
    end
  end

  def edit
    @short_url = ShortUrl.find(params[:id])
  end

  def update
    @short_url = ShortUrl.find(params[:id])
    if @short_url.update_attributes(params[:short_url])
      redirect_to @short_url, :notice  => "Successfully updated short url."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @short_url = ShortUrl.find(params[:id])
    @short_url.destroy
    redirect_to short_urls_url, :notice => "Successfully destroyed short url."
  end

  private
  def short_params
    params.require(:short_url).permit(:original_url)
  end
end
