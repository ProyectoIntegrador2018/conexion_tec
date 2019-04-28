class Common::EventDatesController < Common::AdminCommitteeBaseController
	before_action :set_event_date, only: [:destroy]
	def index
		@dates = EventDate.all
	end

	def new
		@date = EventDate.new()
	end

	def create
		@date = EventDate.new(event_date_params)
		if @date.save
			flash[:success] = "Fecha agregada exitosamente"
			redirect_to admin_event_dates_path
		else
			render 'new'
		end
	end

	def destroy
		@date.destroy
		flash[:success] = "Fecha eliminada exitosamente"
		redirect_to admin_event_dates_path
	end

	private

		def set_event_date
			@date = EventDate.find(params[:id])
		end

		def event_date_params
			params.require(:event_date).permit(:event)
		end

end
