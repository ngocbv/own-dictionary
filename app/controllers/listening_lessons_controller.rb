class ListeningLessonsController < ApplicationController
  before_action :set_listening_lesson, only: [:show, :edit, :update, :destroy]

  # GET /listening_lessons
  # GET /listening_lessons.json
  def index
    @listening_lessons = ListeningLesson.all.includes(:submitted_scripts)
  end

  # GET /listening_lessons/1
  # GET /listening_lessons/1.json
  def show
  end

  # GET /listening_lessons/new
  def new
    @listening_lesson = ListeningLesson.new
  end

  # GET /listening_lessons/1/edit
  def edit
  end

  # POST /listening_lessons
  # POST /listening_lessons.json
  def create
    @listening_lesson = ListeningLesson.new(listening_lesson_params)

    respond_to do |format|
      if @listening_lesson.save
        format.html { redirect_to @listening_lesson, notice: 'Listening lesson was successfully created.' }
        format.json { render :show, status: :created, location: @listening_lesson }
      else
        format.html { render :new }
        format.json { render json: @listening_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listening_lessons/1
  # PATCH/PUT /listening_lessons/1.json
  def update
    respond_to do |format|
      if @listening_lesson.update(listening_lesson_params)
        format.html { redirect_to @listening_lesson, notice: 'Listening lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @listening_lesson }
      else
        format.html { render :edit }
        format.json { render json: @listening_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listening_lessons/1
  # DELETE /listening_lessons/1.json
  def destroy
    @listening_lesson.destroy
    respond_to do |format|
      format.html { redirect_to listening_lessons_url, notice: 'Listening lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listening_lesson
      @listening_lesson = ListeningLesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listening_lesson_params
      params.require(:listening_lesson).permit(:name, :link, :script)
    end
end
