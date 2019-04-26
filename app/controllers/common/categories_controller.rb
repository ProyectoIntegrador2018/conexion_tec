class Common::CategoriesController < Common::AdminCommitteeBaseController

	before_action :set_category, except: [:index, :create]

	def index
		@categories = Category.all
	end

	def edit
		@url = common_category_path
	end

	def new
		@url = common_categories_path
	end

	def update
		if @category.update_attributes(category_params)
			flash[:success] = "Categoría actualizada"
			redirect_to action: 'index'
		else
			@url = common_category_path
			flash.now[:danger] = "Error al actualizar la categoría"
			render 'edit'
		end
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Categoría creada"
			redirect_to action: 'index'
		else
			@url = common_categories_path 
			flash.now[:danger] = "Error al crear la categoría"
			render 'new'
		end
	end

	def set_category
		@category = params[:id].present? ? Category.find(params[:id]) : Category.new
	end

	def destroy
		@category.delete
		flash[:success] = "Categoría eliminada"
		redirect_to action: 'index'
	end
		

	private

		def category_params
			params.require(:category).permit(:name)
		end
end