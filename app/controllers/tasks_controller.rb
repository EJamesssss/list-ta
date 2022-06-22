class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tasks
  def index
    @tasks = current_user.tasks.order("date ASC")
    @urgents  = get_urgents
    @today = @urgents.where("date = ?", Date.current)
    @over = @urgents.where("date < ?", Date.current)
  end

  # GET /tasks/1
  def show
    @back_url = prev_url
  end

  def urgent_list
    @tasks = current_user.tasks
    @urgents  = get_urgents
  end

  def overdue_list
    @tasks = current_user.tasks
    @overdues  = get_urgents
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @back_url = prev_url
  end

  # GET /tasks/1/edit
  def edit
    @back_url = prev_url
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
      redirect_to tasks_path, notice: "Unauthorized user!" if @task.nil?
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:task_name, :task_details, :date, :category_id, :completed_status)
    end

    def get_urgents
      @tasks.where(["date <= ? AND completed_status = ?", Date.current, false])
    end

    def prev_url
      session[:my_previous_url] = URI(request.referer || '').path
    end
end
