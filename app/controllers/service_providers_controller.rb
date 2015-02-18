class ServiceProvidersController < ApplicationController
    before_action :set_service_provider, only: [:show, :edit, :update, :destroy, :add_person]
    load_and_authorize_resource only: [:index, :show, :edit, :update, :destroy, :add_person]

  # GET /service_providers
  # GET /service_providers.json
  def index
    @service_providers = ServiceProvider.all
    respond_to do |format|
        format.json { render :json => @service_providers }
        format.xml  { render :xml => @service_providers }
        format.html
    end
  end

  # GET /service_providers/1
  # GET /service_providers/1.json
  def show
    @workbench = @service_provider.workbench
    respond_to do |format|
      format.html  { render  }
      format.csv  { render csv: @service_provider.person, only: ['_id'] + @workbench.table_attributes.keys  }
    end
  end

  # GET /service_providers/new
  def new
    @service_provider = ServiceProvider.new
  end

  # GET /service_providers/1/edit
  def edit
  end

  # POST /service_providers
  # POST /service_providers.json
  def create
    @service_provider = ServiceProvider.new(service_provider_params)
    respond_to do |format|
      if @service_provider.save
        format.html { redirect_to @service_provider, notice: 'Service provider was successfully created.' }
        format.json { render :show, status: :created, location: @service_provider }
      else
        format.html { render :new }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_providers/1
  # PATCH/PUT /service_providers/1.json
  def update
    respond_to do |format|
      if @service_provider.update_attributes(service_provider_params)
        format.html { redirect_to @service_provider, notice: 'Service provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_provider }
      else
        format.html { render :edit }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_providers/1
  # DELETE /service_providers/1.json
  def destroy
    @service_provider.destroy
    respond_to do |format|
      format.html { redirect_to service_providers_url, notice: 'Service provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_service_provider
      @service_provider = ServiceProvider.find(params[:id])
      logger.debug "From mongo #{@service_provider.to_mongo}"
    end

    def service_provider_params
      params.require(:service_provider).permit(:name)
    end
end
