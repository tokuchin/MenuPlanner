class MenusController < ApplicationController
  def index
    @menus = current_user.menus
    #@inviter_menus = Menu.where(user_id: 6) #自分がinvitee.idを持つ場合は、そのinviterのuser_idの献立を取得するように設定する
    #@menus = (current_user.menus + @inviter_menus).uniq #uniqにより、重複する場合は、重複のないレコードにする。不要？？？
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
  
  def show_menus #その日のmenuに登録したrecipes全てを表示する
    @date = params[:date] #shows_menus画面遷移時点でdateはクエリで引き継がれる。@dateへ保存する。
    @menus = current_user.menus.where(date: @date) #find_byは一つのレコードしか取れないため、whereを使用
  end
  
  def edit
    @menu = Menu.find(params[:id])
    @recipes = current_user.recipes + current_user.favorite_recipes
  end
  
  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to menus_path, info: "編集しました"
    else
      render 'edit'
    end
  end
  
  private
  def menu_params
    params.require(:menu).permit(:date, :recipe_id)
  end
  
end
