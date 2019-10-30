class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten&.save
      flash[:success] = "Kitten created!"
      redirect_to kitten_path(@kitten)
    else
      flash[:warning] = "Invalid input."
      render :new
    end
  end

  def show
    @kitten = Kitten.find_by_id(params[:id])
  end

  def index
    @pagy, @kittens = pagy(Kitten.all, items: 15)
  end

  def edit
    @kitten = Kitten.find_by_id(params[:id])
    @kitten_id = params[:id]
  end

  def update
    @kitten = Kitten.find_by_id(params[:kitten][:kitten_id])
    if @kitten.nil?
      flash.now[:warning] = "Unable to find kitten."
      render :edit
    else
      @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten successfully updated!"
      redirect_to kitten_path(@kitten)
    end
  end

  def destroy
    Kitten.find_by_id(params[:format]).destroy
    flash[:success] = "Kitten removed! They didn't like you anyway."
    redirect_to root_url
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
