class CommentsController < ApplicationController
  def new
    @recipe_id = params[:recipe_id]
    @menu_id = params[:menu_id]
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.recipe_id #@recipe_idではnilになるので、ダメらしい。
      if @comment.save
        redirect_to recipes_path, success: 'レシピへのコメント作成に成功しました'
      else
        redirect_to recipes_path, danger: 'レシピへのコメント作成に失敗しました'
      end
    elsif @comment.menu_id
      if @comment.save
        redirect_to menus_path, success: '献立へのコメント作成に成功しました'
      else
        redirect_to menus_path, danger: '献立へのコメント作成に失敗しました'
      end
    else
      redirect_to menus_path, danger: 'コメント作成に失敗しました'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:recipe_id, :menu_id, :description)
  end
end
