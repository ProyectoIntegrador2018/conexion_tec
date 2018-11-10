class JudgeSessionsController < ApplicationController
    
    def new
    end

    # this method is in charge of redirecting to judge profile if info is valid
    def create
    	@user = login(params[:email], params[:password])
    	if @user 
            if @user.role == "judge"
    		      redirect_to judge_judge_path(@user.judge)
            else
              flash[:danger] = "No tienes los permisos para entrar a esta ruta"
              redirect_to root_path
            end
    	else
    		flash[:danger] = "Usuario o contraseña incorrectos"
    		render 'new'
    	end
    end

    def destroy
    end

end