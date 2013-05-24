class EngineersController < ApplicationController
  before_filter :find_engineer, :only => [:show, :edit, :update, :destroy]

  def index
    @engineers = Engineer.all    
  end

  def new
    @engineer = Engineer.new
  end

  def create
    @engineer = Engineer.new(params[:engineer])
    if @engineer.save    
      redirect_to @engineer, :notice => "Engineer was successfully created."
    else
      flash[:alert] = "Engineer has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @engineer.update_attributes(params[:engineer])
      redirect_to @engineer, :notice => "Engineer has been updated."
    else
      flash[:alert] = "Engineer has not been updated."
      render :action => :edit
    end
  end

  def destroy
    @engineer.destroy
    redirect_to engineers_path, :notice => "Engineer has been deleted."
  end

  private
  def find_engineer
    @engineer = Engineer.find(params[:id])
  end
end
