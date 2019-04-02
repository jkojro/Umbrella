class UmbrellasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_umbrella, only: [:show, :edit, :update, :destroy]

  MESSAGE = 'To jest defaultowy message, który będzie wyświetlany w /new, ale może być zmieniony przez usera'.freeze

  def new
    if current_user.umbrellas.present?
      redirect_to current_user.umbrellas.last
    else
      @umbrella = current_user.umbrellas.build
      @umbrella.message = MESSAGE
    end
  end

  def create
    @umbrella = current_user.umbrellas.build(umbrella_params)
    if @umbrella.save
			redirect_to @umbrella, notice: "Successfully created your umbrella"
		else
			render 'new'
		end
  end

  def show; end

  def edit; end

  def update
    @umbrella.update(umbrella_params)
    redirect_to umbrella_path(@umbrella)
  end

  def destroy
    @umbrella.destroy
    redirect_to new_umbrella_path
  end

  private

  def set_umbrella
      @umbrella = Umbrella.find(params[:id])
    end

  def umbrella_params
    params.require(:umbrella).permit(:message, :thanks_message, friends_attributes: [:id, :email, :answear])
  end
end
