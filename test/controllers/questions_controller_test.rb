require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = Category.create
    @question = questions(:one)
    @question.category = @category
    @question.save
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    login_admin(users(:admin), login-admin_url)
    @category_create = Category.create
    assert_difference('Question.count') do
      post admin_questions_new_path, params: { question: { title: @question.title, text: @question.text, category: @category_create } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    @category = Category.create
    patch question_url(@question), params: { question: { title: @question.title, text: @question.text, category: Category.create } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end
    assert_redirected_to questions_url
  end
end
