module AttendanceHelper
    def judgeAttendance(judge)
        if judge.attended
            judge.attended = false
            judge.save
            false
        else
            judge.attended = true
            judge.save
            true
        end
    end

    def projectAttendance(project)
        if project.attended == 1
            project.attended = 0
            project.save
            false
        elsif project.attended == 0
            project.attended = 1
            project.save
            true
        end
    end

    def blockProject(project)
        if project.attended == 1
            project.attended = 2
            project.save
            true
        elsif project.attended == 2
            project.attended = 1
            project.save
            false
        end
    end
end