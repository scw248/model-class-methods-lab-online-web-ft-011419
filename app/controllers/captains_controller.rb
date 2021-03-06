class CaptainsController < ApplicationController
  
  def index
    @captains = Captain.all
  end

  def show
    @captain = Captain.find(params[:id])
  end

  def new
    @captain = Captain.new
  end

  def create
    @captain = Captain.new(captain_params)

    if @captain.save
      redirect_to @captain
    else
      render :new
    end
  end

  def edit
    @captain = Captain.find(params[:id])
  end

  def update
    @captain = Captain.find(params[:id])

    @captain.update(captain_params)

    if @captain.save
      redirect_to @captain
    else
      render :edit
    end
  end

  def destroy
    @captain = Captain.find(params[:id])
    @captain.destroy
    flash[:notice] = "captain deleted."
    redirect_to captains_path
  end

  private

  def captain_params
    params.require(:captain).permit(:name, :admiral)
  end
end