class HomesController < ApplicationController
  def top
      @book = Book.new
    # Book .new:Bookモデルに格納されているtitleとbodyカラムを格納、＠で@をつけることでコントローラーとViewでデータの受け渡しができる
  end
end
