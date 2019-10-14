module AttendanceHelper
  def judge_attendance(judge)
    attended = judge.attended
    judge.attended = !attended
    judge.save
    judge.attended
  end

  def project_attendance(project)
    attended = project.attended
    project.attended = attended == 0 ? 1 : 0
    project.save
    project.attended == 1
  end

  def block_project(project)
    attended = project.attended
    project.attended = attended == 1 ? 2 : 1
    project.save
    project.attended == 2
  end
end