class EnrollmentsController < ApplicationController
  before_action :set_registry
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :registry_closed, only: [:new, :edit, :update]
  before_action :set_coordinators, only: [:index, :show]
  
  def index
    @enrollments = Enrollment.all
  end

  
  def show
  end

  
  def new
    @enrollment = Enrollment.new
  end

  
  def edit
  end

  
  def create
    @enrollment = Enrollment.new(enrollment_params)
    @all_enrollments_on_registry = Enrollment.where(registry_id: params[:registry_id])
    @participant = Participant.find( @enrollment[:participant_id])
    @check_match = @all_enrollments_on_registry.where(participant_id: @participant.id)
    if @check_match.empty?
      if @enrollment.save
        redirect_to registry_enrollment_path(@registry, @enrollment), notice: 'Enrollment was successfully created.' 
      else
        render :new 
      end
    else
      redirect_to registry_enrollments_path(@registry), notice: 'Participant has already registered.' 
    end
  end

  
  def update
    
    if @enrollment.update(enrollment_params)
      redirect_to registry_enrollment_path(@registry, @enrollment), notice: 'Enrollment was successfully updated.' 
    else
      render :edit 
    end
  end

  
  def destroy
    @enrollment.destroy
    redirect_to registry_enrollments_path(@registry), notice: 'Enrollment was successfully destroyed.' 
  end

  private

    def registry_closed
      if @registry.closed?
        redirect_to registries_path, notice: 'This registry is closed.'
      end  
    end
    
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    def set_coordinators
      @coordinators = CoordinatorRegistry.where(registry_id: params[:registry_id])
    end

    def enrollment_params
      params.require(:enrollment).permit(:registry_id, 
                                       :participant_id,
                                       :date_of_enrollment,
                                       :contact_method_id,
                                       :remarks,
                                       :coordinator_id
                                      )
    end

  def set_registry
    @registry = Registry.find(params[:registry_id])
  end
end
