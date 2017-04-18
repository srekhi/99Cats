class CatRentalRequestsController < ApplicationController
  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(rental_params)
    @cat = Cat.find_by(id: rental_params[:cat_id])
    
    if @request.save
      redirect_to cat_url(@cat)
    else
      render :new
    end

  end

  private

  def rental_params
    params.require(:request).permit(:cat_id, :start_date, :end_date, :status)
  end

end
