class MeController < ApplicationController

  def edit
    binding.pry
    @user = User.find(current_user[:id])
  end

  def update
    @user = User.find(current_user[:id])
    respond_to do |format|
      if @user.update(me_params)
        format.html { redirect_to controller: 'cards', action: 'index' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def me_params
      params.fetch(:user, {}).permit!
    end
end
