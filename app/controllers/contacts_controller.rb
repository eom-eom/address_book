 class ContactsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in



  def index
    @info_ads = InfoAd.sorted
  end

  def show
    @info_ad = InfoAd.find(params[:id])
  end

  def new
    @info_ad = InfoAd.new({:first_name => "Default"})
  end

  def create
    # Instantiate a new object using form parameters
    @info_ad = InfoAd.new(info_ad_params)
    # Save the object
    if @info_ad.save
    # If save succeeds, redirect to the index action
    flash[:notice] = "Address created successfully."
      redirect_to(:action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end
  
  def edit
    @info_ad = InfoAd.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @info_ad = InfoAd.find(params[:id])
     # Update the object
    if @info_ad.update_attributes(info_ad_params)
    # If update succeeds, redirect to the index action
    flash[:notice] = "Address updated successfully."
      redirect_to(:action => 'show', :id => @info_ad.id)
    else
    # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @info_ad = InfoAd.find(params[:id]) 
  end
  
  def destroy
    info_ad = InfoAd.find(params[:id]).destroy
    flash[:notice] = "Address '#{info_ad.first_name}'' destroyed successfully."
    redirect_to(:action =>'index')
  end

  private 

  def info_ad_params
    # same as using "params[:info_ad], except that it:"
    # - raises an error if :info_ad is not present
    # - allows listed attributes to be mass-assigned
    params.require(:info_ad).permit(:id, :first_name, :last_name, :email, :street, :city, :state, :zip_code)
  end

 
end
