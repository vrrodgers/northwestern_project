class CoordinatorsController < ApplicationController
  before_action :set_coordinator, only: [:show, :edit, :update, :destroy]
  
  def index
    @coordinators = Coordinator.all
  end

  def new
    @coordinator = Coordinator.new
  end

  def create
    @coordinator = Coordinator.new(coordinator_params) 

    if @coordinator.save
      redirect_to coordinators_path(@coordinator), notice: 'Coordinator was successfully created.'
    else
      render :new
    end
  end

  def edit
  end
  def update
    
    if  @coordinator.update(coordinator_params)
      redirect_to coordinators_path, notice: 'The coordinator was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @coordinator.destroy
  end
  
  private

  def set_coordinator
    @coordinator = Coordinator.find(params[:id])
  end

  def coordinator_params
     params.require(:coordinator).permit(:name, 
                                      :phone_number,
                                      :email
                                    )
  end

end
