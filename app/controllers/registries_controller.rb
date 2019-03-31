class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]
  before_action :set_toggle_registry, only: [:toggle_status]

  def index
    @registries = Registry.all
    @coordinator_registries = CoordinatorRegistry.new

  end

  def show
    
  end
  
  def new
    @registry = Registry.new 
  end
    
  def create
    @registry = Registry.new(registry_params) 

    if @registry.save
      redirect_to registry_path(@registry), notice: 'Registry was successfully created.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
    if  @registry.update(registry_params)
      redirect_to registry_path, notice: 'The record was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @registry.destroy
  end

  def toggle_status
    if @registry.open?
      @registry.closed!
    elsif @registry.closed?
      @registry.open! 
    end
    redirect_to registries_url, notice: 'Registry status has been updated'
  end
  
  private
    def set_registry
      @registry = Registry.find(params[:id])
    end

    def set_toggle_registry
      @registry = Registry.find(params[:registry_id])
    end

    def registry_params
      params.require(:registry).permit(:name, 
                                       :location,
                                       :status
                                      )
    end


end
