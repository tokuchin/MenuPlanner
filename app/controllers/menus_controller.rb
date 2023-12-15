class MenusController < ApplicationController
  def index
    @menus = current_user.menus
  end

  def new
    @date = params[:date] #new画面遷移時点でdateはクエリで引き継がれるが、登録時にも引き継げるように一旦@dateに保存する
    @menu = Menu.new
    @recipes = current_user.recipes + current_user.favorite_recipes
  end
  
  def create
    @menu = current_user.menus.new(menu_params)
    
    if @menu.save
      redirect_to menus_path, success: '献立作成に成功しました'
    else
      redirect_to menus_path, danger: '献立作成に失敗しました'
    end
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path
  end
  
  private
  def menu_params
    params.require(:menu).permit(:date, :recipe_id)
  end
  
end
