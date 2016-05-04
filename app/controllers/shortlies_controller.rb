class ShortliesController < ApplicationController
   
  before_action :check_url, only: :create

  def index
    @shortly = ShortUrl.where(index: params[:id]).first 
    @recent_shortens = ShortUrl.last(10)
  end

  def show
    @shortly = ShortUrl.where(index: params[:id]).first
    @shortly = ShortUrl.where(shorten_url: params[:id]).first if @shortly.blank?
    @shortly = ShortUrl.where(reserved_url: params[:id]).first if @shortly.blank?

    if @shortly.present?
      @shortly.increment! :click_count
    else
      redirect_to root_path
    end

  end

  def new
    @shortly = ShortUrl.new

  end

  def create
    @shortly = ShortUrl.new(short_params)


    index = Time.now.to_i
    @short = ShortUrl.where(original_url: short_params[:original_url]).first

    if @short.blank?
      shorten_url = ShortenUrl.encode_url(index)
      @shortly.shorten_url = shorten_url
      @shortly.index = index
      if @shortly.save
        redirect_to shortlies_path(short: @shortly.index), :notice => "Successfully created shortly."
      else
        render :action => 'new'
      end
    else
      redirect_to shortlies_path(short: @short.index), :notice => "Successfully created shortly."
    end

  end

  def edit
    @shortly = Shortly.find(params[:id])
  end

  def update
    @shortly = Shortly.find(params[:id])
    if @shortly.update_attributes(params[:shortly])
      redirect_to @shortly, :notice  => "Successfully updated shortly."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @shortly = Shortly.find(params[:id])
    @shortly.destroy
    redirect_to shortlies_url, :notice => "Successfully destroyed shortly."
  end

  private
  def short_params
    params.require(:shortly).permit(:original_url)
  end

  def check_url
    if short_params[:original_url].blank?
      redirect_to shortlies_path
    else

      begin
        value = short_params[:original_url]
        resp = !!value.match(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-=\?]*)*\/?$/)
      rescue URI::InvalidURIError
        resp = false
        redirect_to shortlies_path
      end
      unless resp == true
        redirect_to shortlies_path
      end
    end

  end
end
