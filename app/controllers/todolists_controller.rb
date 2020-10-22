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
    #3.トップ画面へリダイレクト
    redirect_to '/top'
  end
 def index
   @lists = List.all
 end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list) .permit(:title, :body)
  end
end
