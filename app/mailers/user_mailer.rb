class UserMailer < ApplicationMailer
	default from: 'from@example.com'

	def project_confirmation
		@user = params[:user]
	  	@project = params[:project]
	  	mail(to: @user.email, subject: 'Conexión Tec - Confirmación de registro')
	end
end