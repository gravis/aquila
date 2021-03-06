class GoldbricksController < ApplicationController
  before_action :set_goldbrick, only: [:show, :edit, :update, :destroy]

  # GET /goldbricks
  # GET /goldbricks.json
  def index
    @goldbricks = current_vault.goldbricks
  end

  # GET /goldbricks/1
  # GET /goldbricks/1.json
  def show
  end

  # GET /goldbricks/new
  def new
    @goldbrick = current_vault.goldbricks.new
  end

  # GET /goldbricks/1/edit
  def edit
  end

  # POST /goldbricks
  # POST /goldbricks.json
  def create
    @goldbrick = current_vault.goldbricks.new(goldbrick_params)

    respond_to do |format|
      if @goldbrick.save
        format.html do
          flash[:notice] = I18n.t('controller.goldbricks.create.success')
          redirect_to goldbricks_url
        end
        # format.html { redirect_to @goldbrick, notice: I18n.t('controller.goldbricks.create.success') }
        format.json { render action: 'show', status: :created, location: @goldbrick }
        format.js {}
      else
        format.html { render action: 'new' }
        format.json { render json: { errors: @goldbrick.errors }, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /goldbricks/1
  # PATCH/PUT /goldbricks/1.json
  def update
    respond_to do |format|
      if @goldbrick.update(goldbrick_params)
        format.html { redirect_to @goldbrick, notice: I18n.t('controller.goldbricks.update.success')  }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @goldbrick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goldbricks/1
  # DELETE /goldbricks/1.json
  def destroy
    @goldbrick.destroy
    respond_to do |format|
      format.html { redirect_to goldbricks_url }
      format.json { render nothing: true, status: 200 }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goldbrick
      @goldbrick = current_vault.goldbricks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goldbrick_params
      params.require(:goldbrick).permit(:name, :login, :link, :password, :content)
    end
end
