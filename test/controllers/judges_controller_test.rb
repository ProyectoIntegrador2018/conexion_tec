require 'test_helper'

class JudgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:judge)
    @judge = judges(:one)
    @judge.user_id = @user_id
  end

  test "should get index" do
    get judges_url
    assert_response :success
  end

  test "should get new" do
    get new_judge_url
    assert_response :success
  end

  test "should create judge" do
    assert_difference('User.count') do
      post signup_proyecto_url, params: { 
        user: { 
          email: @user.email, crypted_password: @user.crypted_password, salt: @user.salt,
          judge_attributes: { 
            department: @judge.department, has_tablet: @judge.has_tablet, name: @judge.name 
          } 
        }
      }
    end
  end

  test "should show judge" do
    get judge_url(@judge)
    assert_response :success
  end

 # test "should get edit" do
  #  get edit_judge_url(@judge)
  #  assert_response :success
 # end

  #test "should update judge" do
   # patch judge_url(@judge), params: { judge: { department: @judge.department, email: @judge.email, has_tablet: @judge.has_tablet, name: "test" } }
   # assert_redirected_to judge_url(@judge)
  # end

  # test "should destroy judge" do
   # assert_difference('Judge.count', -1) do
    #  delete judge_url(@judge)
    # end

    # assert_redirected_to judges_url
  #end
end
