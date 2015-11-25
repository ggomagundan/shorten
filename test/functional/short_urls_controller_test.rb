require 'test_helper'

class ShortUrlsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ShortUrl.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ShortUrl.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ShortUrl.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to short_url_url(assigns(:short_url))
  end

  def test_edit
    get :edit, :id => ShortUrl.first
    assert_template 'edit'
  end

  def test_update_invalid
    ShortUrl.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ShortUrl.first
    assert_template 'edit'
  end

  def test_update_valid
    ShortUrl.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ShortUrl.first
    assert_redirected_to short_url_url(assigns(:short_url))
  end

  def test_destroy
    short_url = ShortUrl.first
    delete :destroy, :id => short_url
    assert_redirected_to short_urls_url
    assert !ShortUrl.exists?(short_url.id)
  end
end
