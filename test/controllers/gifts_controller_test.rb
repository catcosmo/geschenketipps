require 'test_helper'

class GiftsControllerTest < ActionController::TestCase
  setup do
    @gift = gifts(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:gifts)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create gift' do
    assert_difference('Gift.count') do
      post :create, params: { gift: { abr: @gift.abr, date: @gift.date, fate: @gift.fate, like: @gift.like, name: @gift.name, office: @gift.office, success: @gift.success, value: @gift.value } }
    end

    assert_redirected_to gift_path(assigns(:gift))
  end

  test 'should show gift' do
    get :show, params: { id: @gift }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @gift }
    assert_response :success
  end

  test 'should update gift' do
    patch :update, params: { id: @gift, gift: { abr: @gift.abr, date: @gift.date, fate: @gift.fate, like: @gift.like, name: @gift.name, office: @gift.office, success: @gift.success, value: @gift.value } }
    assert_redirected_to gift_path(assigns(:gift))
  end

  test 'should destroy gift' do
    assert_difference('Gift.count', -1) do
      delete :destroy, params: { id: @gift }
    end

    assert_redirected_to gifts_path
  end
end
