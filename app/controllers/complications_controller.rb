class ComplicationsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

	def create
	@complication = current_user.complications.build(complication_params)
	if @complication.save
	flash[:success] = "Complication created!"
	redirect_to root_url
	else
	@feed_items = []
	render 'static_pages/home'
	end
	end

  def destroy
    @complication.destroy
    redirect_to root_url
  end

			private

			def complication_params
			params.require(:complication).permit(:content)
			end

			def correct_user
      		@complication = current_user.complications.find_by(id: params[:id])
      		redirect_to root_url if @complication.nil?
    		end
	end		