class AttractionsController < ApplicationController

  # before :attraction_params, only: [ :edit, :update, :destroy ]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction, notice: "Attraction was created"
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: "Attraction was updated"
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_url, notice: "Attraction was destroyed"
  end

  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :tickets,
      :min_height,
      :nausea_rating,
      :happiness_rating
    )
  end

end
