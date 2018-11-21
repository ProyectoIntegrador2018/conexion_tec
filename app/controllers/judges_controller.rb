class JudgesController < ApplicationController
  before_action :set_judge, only: [:show, :edit, :update, :destroy]

  def index
    @judges = Judge.all
  end

  def show
  end

  def new
    @user = User.new
    @user.build_judge
  end

  def edit
  end

  def create
    @user = User.new(judge_params)
    if @user.save
      auto_login(@user)
      redirect_to judge_judge_path(@user.judge.id)
    else
      render :new
    end
  end

  def update
    if @judge.update_attributes(judge_params)
      flash[:success] = "Perfil actualizado exitosamente"
      redirect_to @judge
    else
      flash[:error] = "Campos vacíos o no válidos"
      render "edit"
    end
  end

  # DELETE /judges/1
  # DELETE /judges/1.json
  def destroy
    @judge.destroy
    respond_to do |format|
      format.html { redirect_to judges_url, notice: 'Judge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_judge
      @judge = Judge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def judge_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role,
        judge_attributes: [:has_tablet, :department, :name, expertise_area_ids: []])
    end
end
