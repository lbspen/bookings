class ClientsController < ApplicationController
  
  def index
    
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
    
  end

end
