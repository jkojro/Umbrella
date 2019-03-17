class UmbrellasController < ApplicationController
  def new
    @umbrella = Umbrella.new
  end

  def create
    Umbrella.create(params[:id])
  end

  def show
    @umbrella = Umbrella.find(params[:id])
  end
end
