class ClientsController < ApplicationController
  
  def index
    @clients = Client.all    
  end

  def new
    @client = Client.new  
  end

  def create
    @client = Client.new(params[:client])
    if (@client.save) 
      redirect_to @client,
        :notice => "Client was successfully created."
    else
      flash[:alert] = "Client has not been created."
      render :action => "new" 
    end    
  end

  def show
    @client = Client.find(params[:id]) 
  end

  def edit
    @client = Client.find(params[:id])    
  end

  def update
    @client = Client.find(params[:id])
    
    if @client.update_attributes(params[:client])
      redirect_to @client, :notice => "Client has been updated."
    else
      flash[:alert] = "Client has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = "Client has been deleted."
    redirect_to clients_path
  end
end
