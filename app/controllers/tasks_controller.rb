class TasksController < ApplicationController

  def index
  @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    if @task.completed == true
      @task_status = "This task is already done"
    else
      @task_status = "This task is not completed yet"
    end
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(params_task)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

def update
    @task = Task.find(params[:id])
    @task.update(params_task)
    redirect_to tasks_path(@task)

  end

def destroy
  @task = Task.find(params[:id])
  @task.destroy
end


  private

  def params_task
    params.require(:task).permit(:title, :details)
  end
end
