class Common::JudgesAssistanceController < Common::BaseController
  include AttendanceHelper

  before_action :set_judge, only: [:mark_assistance]

  def index
    @judges = Judge.all
  end

  def mark_assistance
    flash[:success] = judge_attendance(@judge) ?
                      'Asistencia registrada' :
                      'Asistencia retirada'
    redirect_to common_judges_assistance_path
  end

  private

  def set_judge
    @judge = params[:id].present? ? Judge.find(params[:id]) : Judge.new
  end

  def judge_params
    params.require(:judge).permit(:attended)
  end
end