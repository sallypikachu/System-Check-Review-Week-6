class BathroomsController < ActionController::Base
  def index
    @bathrooms = Bathroom.all
  end

  def show
    @bathroom = Bathroom.find(params[:id])
  end

  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(bathroom_params)
    if @bathroom.save
      flash.notice = "Bathroom saved successfully"
      binding.pry
      redirect_to bathrooms_path
    else
      flash.notice = @bathroom.errors.full_messages.join(". ")
      binding.pry
      render "new"
    end
  end

  private
  def bathroom_params
    params.require(:bathroom).permit(
      :name,
      :address,
      :city,
      :state,
      :zip,
      :description
    )
  end
end
