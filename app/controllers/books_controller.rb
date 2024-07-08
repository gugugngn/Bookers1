class BooksController < ApplicationController

  def new
   
  end
  
  def index
   @books = Book.all
  # 一覧画面には投稿したbook全てを表示させるので、全てのデータを取得する記述
   @book = Book.new
  # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成??はて。。。？
  end
  
   def create
  book = Book.new(book_params)
  # データを受け取り新規登録するためのインスタンス作成
  book.save
  redirect_to book_path(book.id)
  #show.html.erbを表示
   end 
 
  def show
   @book = Book.find(params[:id])
  end
  
  def edit
   @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path
  end
  
  def destroy
   
  end
 
 private
 def book_params
   params.require(:book).permit(:title, :body)
  # bookモデルを指定し、データを絞り込み⇨保存するカラムを指定。脆弱性を防いでいるらしい。
 end 
end

 
