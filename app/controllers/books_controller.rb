class BooksController < ApplicationController

  def new
   
  end
  
  def index
   @books = Book.all    # 一覧画面には投稿したbook全てを表示させるので、全てのデータを取得する記述
   @book = Book.new      # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成??空箱を用意するイメージ。そこにtitleやbodyの情報が入り、idで番号をつけて
 
  end
  
  def create
   @book = Book.new(book_params)    # データを受け取り新規登録するためのインスタンス作成
   if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)    #show.html.erbを表示list_pathのみを書いた場合、showアクションはどの投稿を見ればよいのかわからず、エラーになる
   else
    @books = Book.all
    render :index
   end
  end 
 
  def show
   @book = Book.find(params[:id])
  end
  
  def edit
   @book = Book.find(params[:id])         # Bookモデルのユーザーが指定したレコード（１行）のデータをインスタンス変数＠に格納⭐︎
  end
  
  def update
    @book = Book.find(params[:id])      # bookに＠をつけるかどうかの見極めは⇨Viewファイルがインスタンス変数を参照する必要があるかどうか
    if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path# (book.id)
    else
     @books = Book.all
     render :edit
    end
  end
  
  def destroy
   book = Book.find(params[:id])        # 「削除」ボタンをクリックすると、削除リストのid付きでURLが送信される。送られてきた削除idを元にレコードが探され、
   book.destroy                            # そのレコードを削除します。
   redirect_to '/books'
  end
 
  private
   def book_params
   params.require(:book).permit(:title, :body)        # bookモデルを指定し、データを絞り込み⇨保存するカラムを指定。脆弱性を防いでいるらしい。
  end 
end

 
