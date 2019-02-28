class Admin::EditionsController < Admin::BaseController

	before_action :set_edition, except: [:index]

	def index
		@editions = Edition.all
	end

	def new
		@url = admin_editions_path
	end

	def edit
		@url = admin_edition_path
	end

	def create
		# Set params
		@edition.number = edition_params['number']
		@edition.registry_open = Date.parse(edition_params['registry_open']) if edition_params['registry_open'].present?
		@edition.registry_limit = Date.parse(edition_params['registry_limit']) if edition_params['registry_limit'].present?
		@edition.video_open = Date.parse(edition_params['video_open']) if edition_params['video_open'].present?
		@edition.video_limit = Date.parse(edition_params['video_limit']) if edition_params['video_limit'].present?

		if @edition.save
			flash[:success] = "Edición creada"
			redirect_to admin_editions_path
		else
			@url = admin_editions_path
			flash.now[:danger] = "Error al crear edición"
			render 'new'
		end
	end

	def update
		# Set params
		@edition.number = edition_params['number']
		@edition.registry_open = edition_params['registry_open'].present? ? Date.parse(edition_params['registry_open']) : nil
		@edition.registry_limit = edition_params['registry_limit'].present? ? Date.parse(edition_params['registry_limit']) : nil
		@edition.video_open = edition_params['video_open'].present? ? Date.parse(edition_params['video_open']) : nil
		@edition.video_limit = edition_params['video_limit'].present? ? Date.parse(edition_params['video_limit']) : nil

		if @edition.save
			flash[:success] = "Edición editada correctamente"
			redirect_to admin_editions_path
		else
			@url = admin_edition_path
			flash.now[:danger] = "Error al editar edición"
			render 'edit'
		end
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