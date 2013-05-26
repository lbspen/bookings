class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @engineers = Engineer.all
    @clients = Client.all
    @booking = Booking.new
  end

  def create
    @engineer = Engineer.find(params[:booking][:engineer_id])
    @booking = @engineer.bookings.build
    @client = Client.find(params[:booking][:client_id])
    @booking.client = @client
    if @booking.save
      redirect_to @booking, :notice => "Booking has been created."
    end
  end

  def show
    @booking = Booking.find(params[:id])  
  end
end
