class TasksController < ApplicationController
  before_action :logged_in_user
  before_action :set_current_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def new
  end
  
  def index
    @tasks = Task.all.order(id: "DESC")
  end
  
  def new
  end
  
  def create
    @task = Task.new(task_name: params[:task_name],
                     task_description: params[:task_description],
                     user_id: @current_user.id)
    if @task.save
      flash[:success] = '新規作成に成功しました。'
    else
      flash[:danger] = '新規作成に失敗しました。'
    end
    redirect_to tasks_index_url
    
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @task.task_name = params[:task_name]
    @task.task_description = params[:task_description]
    if @task.save
      flash[:success] = '更新に成功しました。'
      redirect_to tasks_index_url
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit 
    end
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_index_url
  end
 
    # beforeフィルター
    
    # ログイン済みのユーザーか確認します。
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
    

    
    # paramsハッシュからタスクを取得します。
    def set_task
      @task = Task.find(params[:id])
    end
    
    # アクセスしたユーザーが現在ログインしているユーザーか確認します。
    def correct_user
      redirect_to(root_url) unless @task.user_id == current_user.id
    end
    
end
