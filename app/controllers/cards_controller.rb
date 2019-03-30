class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def subscribe
    CardsUser.find_or_create_by(users_id: params[:user_id], cards_id: params[:id])
    redirect_back fallback_location: root_path
  end

  def unsubscribe
    CardsUser.where(users_id: params[:user_id], cards_id: params[:id]).delete_all
    redirect_back fallback_location: root_path
  end

  # GET /cards
  # GET /cards.json
  def index
    @categories =  Category.includes(:users).all
    @cards = params[:category_id] ? Card.where(category_id: params[:category_id]).all : Card.all
    @cards = [] unless @cards
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  def categories_list
    @categories_list ||= Category.all
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  #
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card

      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :title, :event_date, :max_users_count, :category_id)
    end
end
