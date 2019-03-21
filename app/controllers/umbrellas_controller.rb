class UmbrellasController < ApplicationController
  MESSAGE = 'To jest defaultowy message, który będzie wyświetlany w /new, ale może być zmieniony przez usera'.freeze
  def new
    @umbrella = Umbrella.new
    @umbrella.message = MESSAGE
  end

  def create
    Umbrella.create(umbrella_params)
    render plain: 'After create placeholder'
  end

  def show
    @umbrella = Umbrella.find(params[:id])
  end

  private

  def umbrella_params
    params.require(:umbrella).permit(:message, friends_attributes: [:id, :email, :answear])
  end
end
