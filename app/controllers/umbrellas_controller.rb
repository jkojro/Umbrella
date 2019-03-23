class UmbrellasController < ApplicationController
  before_action :authenticate_user!

  MESSAGE = 'To jest defaultowy message, który będzie wyświetlany w /new, ale może być zmieniony przez usera'.freeze

  def new
    @umbrella = current_user.umbrellas.build
    @umbrella.message = MESSAGE
  end

  def create
    @umbrella = current_user.umbrellas.build(umbrella_params)
    if @umbrella.save
			redirect_to @umbrella, notice: "Successfully created your umbrella"
		else
			render 'new'
		end
  end

  def show
    @umbrella = Umbrella.find(params[:id])
  end

  private

  def umbrella_params
    params.require(:umbrella).permit(:message, friends_attributes: [:id, :email, :answear])
  end
end
