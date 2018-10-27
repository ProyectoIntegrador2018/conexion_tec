require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:project)
    @project = projects(:one)
    @project.user = @user
  end

  test "should get index" do
    authenticated = ApplicationHelper.encrypt("admin")
    get projects_url, params: {message: authenticated}
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post signup_proyecto_url, params: { 
        user: { 
          email: @user.email, password: @user.password, role: @user.role, password: "password", 
          project_attributes: { 
            abstract: @project.abstract, client: @project.client, field: @project.field, 
            name: @project.name, expertise_area: @project.expertise_area, video_url: @project.video_url
          }
        }
      }
    end
    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

end
