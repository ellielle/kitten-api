class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create

  end

  def show
    @kitten = Kitten.find_by_id(params[:id])
  end

  def index
    @kittens = Kitten.all
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
