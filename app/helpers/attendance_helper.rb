module AttendanceHelper
    def attendance(obj)
        if obj.attended
            obj.attended = false
            obj.save
            false
        else
            obj.attended = true
            obj.save
            true
        end
    end
end