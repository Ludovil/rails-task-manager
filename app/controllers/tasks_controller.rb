class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    raise
    set_task
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private

  def set_task
    @tasks = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:name, :details, :completed)
  end
end
