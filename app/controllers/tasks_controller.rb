class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    
  end

  private
  def tank_params
    params.require(:task).permit(:title, :content)
  end
end
