class CharactersController < ApplicationController
  include EveOnline
  def index
    @characters = Character.all
  end

  def show
    character_id = params[:id]
    @character = Character.find(character_id)
    @toon = EveOnline::XML::AccountCharacters.new(@character.key_id.to_i, @character.v_code)
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id
    if @character.save
      redirect_to @character
    end
  end

  def edit
    @character = Character.find_by_id(params[:id])
    if current_user.id == @character.user_id
      render :edit
    else
      flash[:notice] = "You do not own this character"
      redirect_to root_path
    end
  end

  def update
    @character = Character.find_by_id(params[:id])
    if current_user.id == @character.user_id
      @character.update_attributes(character_params)
      redirect_to character_path(@character)
    else
      flash[:notice] = "You do not own this character"
      redirect_to root_path
    end
  end



  private

  def character_params
    params.require(:character).permit(:name, :user_id, :v_code, :key_id)
  end

end
