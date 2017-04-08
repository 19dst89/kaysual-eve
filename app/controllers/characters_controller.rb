class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    character_id = params[:id]
    @character = Character.find(character_id)
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



  private

  def character_params
    params.require(:character).permit(:name, :user_id)
  end

end
