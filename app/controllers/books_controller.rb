class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @books }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      respond_to do |format|
        format.html { render :action => "index" }
        format.xml  { render :xml => @books }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
    @books = Book.search do
      keywords params[:query]
    end.results
  
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @books }
    end
  end
  private
    def book_params
      params.require(:book).permit(:title, :isbn)
    end


end
