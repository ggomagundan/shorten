require 'test_helper'

class ShortliesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Shortly.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Shortly.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Shortly.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to shortly_url(assigns(:shortly))
  end

  def test_edit
    get :edit, :id => Shortly.first
    assert_template 'edit'
  end

  def test_update_invalid
    Shortly.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Shortly.first
    assert_template 'edit'
  end

  def test_update_valid
    Shortly.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Shortly.first
    assert_redirected_to shortly_url(assigns(:shortly))
  end

  def test_destroy
    shortly = Shortly.first
    delete :destroy, :id => shortly
    assert_redirected_to shortlies_url
    assert !Shortly.exists?(shortly.id)
  end
end
