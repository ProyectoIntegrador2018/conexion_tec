class Common::JudgesAssistanceController < Common::BaseController
    before_action :set_judge, only: [:mark_assistance]

    def index
        @judges = Judge.all
    end
    
    def mark_assistance
        if @judge.attended
            @judge.attended = false
        else
            @judge.attended = true
        end

        if @judge.save
            flash[:success] = "Asistencia registrada"
            redirect_to action: 'index'
        else
            flash[:error] = "Error: No se pudo registrar asistencia"
            redirect_to action: 'index'
        end
    end

    private
		def set_judge
            @judge = params[:id].present? ? Judge.find(params[:id]) : Judge.new
		end

		def judge_params
			params.require(:judge).permit(
				:attended)
		end

end