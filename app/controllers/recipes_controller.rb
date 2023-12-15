class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:favorite_users)
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path, success: 'レシピ登録に成功しました'
    else
      flash.now[:danger] = "レシピ登録に失敗しました"
      render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :image, :description)
  end
  
end
