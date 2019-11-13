class Common::EditionsController < Common::AdminCommitteeBaseController
  include Common::EditionsHelper

  before_action :set_edition, except: [:index]
  before_action :set_params, only: [:create, :update]

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
    # validate number uniqueness
    # validate dates logic
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
    if @edition.save
      flash[:success] = 'Edición editada correctamente'
      redirect_to common_editions_path
    else
      @url = common_edition_path
      flash.now[:danger] = 'Error al editar edición'
      render 'edit'
    end
  end

  def destroy
    @edition.delete
    flash[:success] = 'Edición eliminada'
    redirect_to common_editions_path
  end

  private

  def set_params
    @edition.number = edition_params['number']
    @edition.video_open = parse_date(edition_params['video_open'])
    @edition.video_limit = parse_date(edition_params['video_limit'])
    @edition.ending_date = parse_date(edition_params['ending_date'])
    @edition.starting_date = parse_date(edition_params['starting_date'])
    @edition.registry_open = parse_date(edition_params['registry_open'])
    @edition.registry_limit = parse_date(edition_params['registry_limit'])
  end

  def set_edition
    @edition = params[:id].present? ? Edition.find(params[:id]) : Edition.new
  end

  def edition_params
    params.require(:edition).permit(:number,
                                    :video_open,
                                    :video_limit,
                                    :ending_date,
                                    :starting_date,
                                    :registry_open,
                                    :registry_limit)
  end
end
