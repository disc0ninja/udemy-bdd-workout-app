class ExercisesController < ApplicationController
  before_action :set_user

  def index
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = @user.exercises.build(exercise_params)

    if @exercise.save
      flash[:success] = "Exercise has been created successfully"
      redirect_to user_exercise_path(current_user, @exercise)
    else
      flash[:danger] = "Exercise could not be saved"
      redirect_to new_user_exercise_path(@user)
    end

  end

  def show
    @exercise = @user.exercises.find(params[:id])
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date)
  end

  def set_user
    @user = current_user
  end

end
