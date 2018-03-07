class SubmittedScriptsController < ApplicationController
  before_action :authenticate_user!

  def new
    @submitted_script = SubmittedScript.new user: current_user, listening_lesson_id: params[:listening_lesson_id]
  end

  def create
    script = SubmittedScript.new submitted_script_params

    if script.save
      redirect_to listening_lesson_path(script.listening_lesson)
    end
  end

  def edit
    @submitted_script = SubmittedScript.find params[:id]
  end

  def update
    script = SubmittedScript.find params[:id]
    script.update submitted_script_params

    if script.save
      redirect_to listening_lesson_path(script.listening_lesson)
    end
  end

  private
  def submitted_script_params
    params.require(:submitted_script).permit(:user_id, :listening_lesson_id, :content)
  end
end
