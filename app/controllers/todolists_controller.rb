class TodolistsController < ApplicationController
  def new
    @list = List.new
  end
  # 以下を追加C
  def create
    # １.データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    #2.データをデータベースに保存するためのsaveメソッド実行
    list.save
    #3.redirect_to '/top'を削除して以下コマンドに変更
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
    
  end
 def index
   @lists = List.all
 end
 def show
   @list = List.find(params[:id])
 end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list) .permit(:title, :body)
  end
end
