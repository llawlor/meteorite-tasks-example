class TasksController < ApplicationController

  # update a task
  def update
    # get the task
    task = Task.find(params[:id])
    # update the task
    task.update_attributes(task_params)
    # push to redis
    $redis.publish(Meteorite.bind_key(task), task.to_json)
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
    # render the partial to a string
    task_string = render_to_string(partial: 'task', locals: { task: task })
    # push to redis
    $redis.publish(Meteorite.bind_key(Task.all), task_string)
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
