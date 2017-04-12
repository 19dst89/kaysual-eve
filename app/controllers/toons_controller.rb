class ToonsController < ApplicationController
  include ToonsHelper

  def index
    @toons = Toon.all
  end

  def show
    toon_id = params[:id]
    @toon = Toon.find(toon_id)
    # First Character on account
    @character = @toon.eve_character
    # Character ID
    @character_id = @character.character_id
    # Character Portrait
    @character_portrait = @character.eve_portrait
    # Character ISK Balance
    @account_balance = EveOnline::Characters::AccountBalance.new(@toon.key_id, @toon.v_code)
    # General Character Sheet i.e. skills and such
    @character_sheet = character_sheet(@toon.key_id, @toon.v_code, @character_id)
    # Number of total skill points
    @num_of_skills = @character_sheet.skills.size
    # Account Status
    @account_status = EveOnline::Account::Status.new(@toon.key_id, @toon.v_code)

    @skills_by_level = skill_names_by_level(@toon.key_id, @toon.v_code, @character_id)
  end

  def new
    @toon = Toon.new
  end

  def create
    @toon = Toon.new(toon_params)
    @toon.user_id = current_user.id
    if @toon.save
      redirect_to @toon
    end
  end

  def edit
    @toon = Toon.find_by_id(params[:id])
    if current_user.id == @toon.user_id
      render :edit
    else
      flash[:notice] = "You do not own this toon"
      redirect_to root_path
    end
  end

  def update
    @toon = Toon.find_by_id(params[:id])
    if current_user.id == @toon.user_id
      @toon.update_attributes(toon_params)
      redirect_to toon_path(@toon)
    else
      flash[:notice] = "You do not own this toon"
      redirect_to root_path
    end
  end



  private

  def toon_params
    params.require(:toon).permit(:name, :user_id, :v_code, :key_id)
  end

end
