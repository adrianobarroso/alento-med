class TreatmentsController < ApplicationController

  # def new
  #   @treatment = Treatment.new()
  # end

  def create
  @treatment = Treatment.new(treatment_params)
  @treatment.user = current_user
  @treatment.save!
    if current_user.email == ""
      redirect_to edit_user_path(current_user)
    else
      redirect_to treatments_path
    end
  end

  def index
    @treatments = Treatment.where(user_id: current_user)
  end

  private

  def treatment_params
    params.require(:treatment).permit(:institution_id, :trial_id, :doctor_id)
  end

end
