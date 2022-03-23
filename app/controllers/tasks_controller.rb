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
            format.html { redirect_to task_path, notice: 'Your task is now live.' }
        else
            format.html { render :new }
        end
    end
  end

  private

  def task_params
    params.permit(:task).require(:title, :description)
  end
end
