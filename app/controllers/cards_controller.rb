class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  helper_method :more_than_two
  helper_method :count_of_users
  helper_method :is_free_places?

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
    @categories =  Category.all
    @cards = params[:category_id] ? Card.where(category_id: params[:category_id]).all : Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @messages = Chat.all
    @message = Chat.new

  end

  def categories_list
    @categories_list ||= Category.all
  end

  # GET /cards/new
  def new
    @card = Card.new
    @message = Chat.new
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
        format.html { redirect_to @card }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_message
    @card = Card.find_by(id: params[:id])
    @message = Chat.new(chat_params)
    respond_to do |format|
      if @message.save
        p @message
        format.html { redirect_to @card, notice: 'Message was successfully posted.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
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

  def more_than_two(card)
    if card.users && card.users.size > 2
      return "и ещё #{card.users.size - 2}"
    end
  end

  def count_of_users(card)
    return "#{card.users.size}из#{card.max_users_count}"
  end

  def is_free_places?(card)
    return card.users.size < card.max_users_count.to_i
  end

  def show_cats

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

    def chat_params
      params.require(:chat).permit(:username, :message, :chat_id)
    end

end
