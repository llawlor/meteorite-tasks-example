class TasksController < ApplicationController

  # update a task
  def update
    # get the task
    task = Task.find(params[:id])
    # update the task
    task.update_attributes(task_params)
    # blank response
    head :ok
  end

  # show all tasks
  def index
    @task = Task.new
    @tasks = Task.all
  end

  # add a new task
  def create
    # create the task
    task = Task.create(task_params)
    # blank response
    head :ok
  end

  # delete a task
  def destroy
    # get the task
    task = Task.find(params[:id])
    # destroy the task
    task.destroy
    # blank response
    head :ok
  end

  private
  
    # strong parameters
    def task_params
      params.require(:task).permit(:text, :checked)
    end
    
end
