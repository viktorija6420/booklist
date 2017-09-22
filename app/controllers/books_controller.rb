class BooksController < ApplicationController

 def index
   @books = Book.all

   respond_to do |format|
     format.html
     format.text

     format.json do
       render json: @books.map { |book|
       {Title: book.title,
        Author: book.author,
        Read?: book.already_read
        }
      }

    end
    

     format.csv { render plain:" #{Book.generate_csv(@books)}"}

end
end
end
