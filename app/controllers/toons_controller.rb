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
    @character_portrait = @toon.eve_portrait
    # Character ISK Balance
    @account_balance = @toon.eve_account_balance
    # General Character Sheet i.e. skills and such
    @character_sheet = @toon.eve_character_sheet
    # Number of total skill points
    @num_of_skills = @character_sheet.skills.size
    # Account Status
    @account_status = @toon.eve_account_status
    # Organize Skills By Level Trained
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

  def destroy
    @toon = Toon.find_by_id(params[:id])
    if current_user.id == @toon.user_id
      @toon.destroy
      redirect_to user_path(current_user)
    else
      flash[:notice] = "You do not own this character"
      redirect_to toon_path(@toon)
    end
  end



  private

  def toon_params
    params.require(:toon).permit(:name, :user_id, :v_code, :key_id)
  end

end
