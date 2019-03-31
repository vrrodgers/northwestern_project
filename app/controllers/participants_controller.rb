class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.all
  end

  def show
  end

  def new
    @participant = Participant.new
  end

  def edit
  end

  def create
    @participant = Participant.new(participant_params)
    @verify_new = Participant.where(name: @participant.name).where(gender: @participant.gender).where(date_of_birth: @participant.date_of_birth)
    if @verify_new.empty?
      if @participant.save
        redirect_to @participant, notice: 'Participant was successfully created.' 
      else
        render :new 
      end
    else
      redirect_to participants_path, notice: 'Participant already exist.' 
    end
  end

  def update
    if @participant.update(participant_params)
      redirect_to @participant, notice: 'Participant was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @participant.destroy
    redirect_to participants_url, notice: 'Participant was successfully destroyed.' 
  end

  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:name, 
                                       :gender,
                                       :date_of_birth,
                                       :phone,
                                       :email
                                      )
    end
end
