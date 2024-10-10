class TasksController < ApplicationController
    before_action :set_task, only: [:complete]
  

    def index
      @tasks = Task.incomplete
      @task = Task.new
    end
  

    def create
      @task = Task.new(task_params)
      @task.status = :incomplete
  
      if @task.save
        redirect_to tasks_path
      else
        @tasks = Task.incomplete
        render :index
      end
    end
  
    def complete
      @task.complete!
      redirect_to tasks_path
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name)
    end
  end
  