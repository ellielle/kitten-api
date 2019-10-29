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
      redirect_to create_kitten_path
    end
  end

  def show
    @kitten = Kitten.find_by_id(params[:id])
  end

  def index
    @pagy, @kittens = pagy(Kitten.all, items: 15)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
