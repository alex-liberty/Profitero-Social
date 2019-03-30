class MeController < ApplicationController

  # GET /me/1/edit
  def edit
    @user = User.find(current_user[:id])
  end

  # PATCH/PUT /me/1
  # PATCH/PUT /me/1.json
  def update
    @user = User.new(me_params)

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
      params.fetch(:me, {})
    end
end
