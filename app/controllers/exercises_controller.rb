class ExercisesController < ApplicationController
  before_action :set_user
  before_action :set_exercise, only: [:edit, :update, :show, :destroy]

  def index
    @exercises = @user.exercises
  end

  def new
    @exercise = @user.exercises.new
  end

  def create
    @exercise = @user.exercises.build(exercise_params)

    if @exercise.save
      flash[:success] = "Exercise has been created successfully"
      redirect_to user_exercise_path(current_user, @exercise)
    else
      flash.now[:danger] = "Exercise could not be saved"
      render :new
    end
  end

  def edit
  end

  def update

    if @exercise.update(exercise_params)
      flash[:success] = "Exercise has been updated"
      redirect_to [@user, @exercise]
    else
      flash.now[:danger] = "Exercise has not been updated"
      render :edit
    end
  end

  def show
  end

  def destroy
    @exercise.destroy
    flash[:notice] = "Exercise has been deleted"
    redirect_to user_exercises_path(@user)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date)
  end

  def set_user
    @user = current_user
  end

  def set_exercise
    @exercise = @user.exercises.find(params[:id])
  end

end
