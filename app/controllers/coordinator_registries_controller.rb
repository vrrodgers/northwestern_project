class CoordinatorRegistriesController < ApplicationController
  before_action :set_registry
  before_action :set_coordinator_registry, only: [:show, :edit, :update, :destroy]


  def new
    @coordinator_registry = CoordinatorRegistry.new
  end

  
  def edit
  end

  
  def create
    @coordinator_registry = CoordinatorRegistry.new(coordinator_registry_params)
    if @coordinator_registry.save
      redirect_to registry_path(@registry), notice: 'Coordinator registry was successfully created.' 
      
    else
        render :new 
    end
  end

 
  def update
    if @coordinator_registry.update(coordinator_registry_params)
       redirect_to registry_path(@registry), notice: 'Coordinator registry was successfully updated.' 
    else
      render :edit 
    end
  end

  
  def destroy
    @coordinator_registry.destroy
    redirect_to registry_path(@registry), notice: 'Coordinator registry was successfully destroyed.' 
  end

  private
   
    def set_registry
      @registry = Registry.find(params[:registry_id])
    end

    def set_coordinator_registry
      @coordinator_registry = CoordinatorRegistry.find(params[:id])
    end

    
    def coordinator_registry_params
     params.require(:coordinator_registry).permit(:registry_id, 
                                      :coordinator_id
                                    )
    end
end
