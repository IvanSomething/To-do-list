# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
        if @task.save
            format.html { redirect_to root_path }
        else
            format.html { render :new }
        end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

      respond_to do |format|
          if @task.update(task_params)
              format.html { redirect_to root_path }
          else
              format.html { render :edit }
          end
      end
  end

  def destroy
    @task = Task.find(params[:id])
    
    @task.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
    end
end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
