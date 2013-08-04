require 'test_helper'

class SuperFilesControllerTest < ActionController::TestCase
  setup do
    @super_file = super_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:super_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create super_file" do
    assert_difference('SuperFile.count') do
      post :create, super_file: { extension: @super_file.extension, name: @super_file.name, size: @super_file.size, storage: @super_file.storage }
    end

    assert_redirected_to super_file_path(assigns(:super_file))
  end

  test "should show super_file" do
    get :show, id: @super_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @super_file
    assert_response :success
  end

  test "should update super_file" do
    put :update, id: @super_file, super_file: { extension: @super_file.extension, name: @super_file.name, size: @super_file.size, storage: @super_file.storage }
    assert_redirected_to super_file_path(assigns(:super_file))
  end

  test "should destroy super_file" do
    assert_difference('SuperFile.count', -1) do
      delete :destroy, id: @super_file
    end

    assert_redirected_to super_files_path
  end
end
