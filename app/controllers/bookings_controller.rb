class BookingsController < ApplicationController
  before_filter :find_booking, :only => [:show, :edit, :update]
  before_filter :select_form_choices, :only => [:new, :edit]
  before_filter :find_engineer_and_client, :only => [:create, :update]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @engineer.bookings.build(:cost => params[:booking][:cost])
    @booking.client = @client
    if @booking.save
      redirect_to @booking, :notice => "Booking has been created."
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking.client = @client
    @booking.engineer = @engineer
    @booking.update_attributes(params[:booking].slice(:cost))
    redirect_to @booking, :notice => "Booking was successfully updated."
  end

  private
  def find_booking
    @booking = Booking.find(params[:id])
  end

  def select_form_choices
    @engineers = Engineer.all
    @clients = Client.all
  end

  def find_engineer_and_client
    @engineer = Engineer.find(params[:booking][:engineer_id])
    @client = Client.find(params[:booking][:client_id])
  end    
end
