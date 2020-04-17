class TasksController < ApplicationController
  
  before_action :set_current_user
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def new
  end
  
  def index
    @tasks = Task.all
  end
  
  def new
  end
  
  def create
    @task = Task.new(task_name: params[:task_name],
                     task_description: params[:task_description],
                     user_id: @current_user.id)
    @task.save
    redirect_to tasks_index_url
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.task_name = params[:task_name]
    @task.task_description = params[:task_description]
    @task.save
    redirect_to tasks_index_url
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_index_url
  end
 
end
