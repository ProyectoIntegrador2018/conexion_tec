require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
    @project = projects(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  #TODO(jvazquez96): Fix test once we have figure it out how to solve it
  # test "should create student" do
  #   post projects_url, params: { project: { abstract: @project.abstract, client: @project.client, field: @project.field, name: @project.name, password: "password", password_confirmation: "password", kind: @project.kind, video_url: @project.video_url, email: "test@test.com", user_id: @student.id } }
  #   puts @student.id
  #   assert_difference('Student.count') do
  #     post students_url, params: {student: { email: @student.email, name: @student.name, enrollment: @student.enrollment, major: @student.major, project_id: @project.id}}
  #   end
  #   assert_redirected_to student_path(Student.last)
  # end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  #TODO(jvazquez96): Fix test once we have figure it out how to solve it
  # test "should update student" do
  #   patch student_url(@student), params: {student: { email: @student.email, name: @student.name, enrollment: @student.enrollment, major: @student.major}}
  #   assert_redirected_to student_url(@student)
  # end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
