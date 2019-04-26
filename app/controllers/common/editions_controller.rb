class Common::EditionsController < Common::AdminCommitteeBaseController

	before_action :set_edition, except: [:index]

	def index
		@editions = Edition.all
	end

	def new
		@url = common_editions_path
	end

	def edit
		@url = common_edition_path
	end

	def create
		set_params
		if @edition.save
			flash[:success] = 'Edición creada'
			redirect_to common_editions_path
		else
			@url = common_editions_path
			flash.now[:danger] = 'Error al crear edición'
			render 'new'
		end
	end

	def update
		set_params
		if @edition.save
			flash[:success] = 'Edición editada correctamente'
			redirect_to common_editions_path
		else
			@url = common_edition_path
			flash.now[:danger] = 'Error al editar edición'
			render 'edit'
		end
	end

	# Set params
	def set_params
		registry_open = edition_params['registry_open']
		registry_limit = edition_params['registry_limit']
		video_open = edition_params['video_open']
		video_limit = edition_params['video_limit']

		@edition.number = edition_params['number']
		@edition.registry_open = registry_open.present? ? Date.parse(registry_open) : nil
		@edition.registry_limit = registry_limit.present? ? Date.parse(registry_limit) : nil
		@edition.video_open = video_open.present? ? Date.parse(video_open) : nil
		@edition.video_limit = video_limit.present? ? Date.parse(video_limit) : nil
	end

	def set_edition
		@edition = params[:id].present? ? Edition.find(params[:id]) : Edition.new
	end

	private

		def edition_params
			params.require(:edition).permit(:number,
											:registry_open,
											:registry_limit,
											:video_open,
											:video_limit)
		end
end
