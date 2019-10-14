module AttendanceHelper
  def judge_attendance(judge)
    judge.attended = !judge.attended
    judge.save
    return judge.attended
  end

  def project_attendance(project)
    project.attended = project.attended == 0 ? 1 : 0
    project.save
    return project.attended == 1
  end

  def block_project(project)
    project.attended = project.attended == 1 ? 2 : 1
    project.save
    return project.attended == 2
  end
end