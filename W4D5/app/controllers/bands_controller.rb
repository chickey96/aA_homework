class BandsController < ApplicationController
  before_action :verify_band_ownership, only: [:edit, :update, :destroy]
  before_action :verify_logged_in, only: [:new, :edit, :update, :destroy]
  before_action :set_current_band

  def set_current_band
    @current_band ||= nil 
  end

  def new
    render :new
  end

  def create
    @band = Band.new(name: params[:band][:name], band_owner_id: current_user.id) 
    if @band.save!
      redirect_to band_url(@band)
    else  
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def index
    @bands = Band.all 
    render :index 
  end

  def show
    @band = Band.find(params[:id])
    @current_band = @band.id 
    render :show 
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(name: params[:band][:name])
      redirect_to band_url(@band)
    else 
      flash[:errors] = @band.errors.full_messages
      redirect_to edit_band_url(@band)
    end
  end

  def destroy
    band = Band.find(params[:id])
    if band.delete
      redirect_to bands_url 
    else 
      flash[:errors]
      redirect_to edit_band_url(@band)
    end
  end

   def verify_band_ownership
    if !current_user.bands.include?(Band.find(params[:id]))
      flash[:errors] = 'Cannot edit a band you did not create'
      redirect_to band_url(Band.find(params[:id]))
    end 
  end

  def verify_logged_in
    if current_user.nil?
      flash[:errors] = 'Must be logged in to edit/create a band'
      redirect_to bands_url
    end
  end

end