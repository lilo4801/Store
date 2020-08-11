class ProductController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books=Book.all
  end
  def show
  end
  def new
    @book=current_user.books.build
  end
  def edit
  end
  def create
    @book=current_user.books.build(params_book)
    if @book.save
      redirect_to product_path(@book), notice: 'Book was saved'

    else
      render :new
    end
  end
  def update
    if @book.update(params_book)
      redirect_to product_path(@book) ,notice: 'Book was updated'
    else
      render :edit
    end
  end
  def destroy
    @book.destroy
    flash[:notice]='Book was successfully destroyed.'
    redirect_to product_index_path
  end
  private
  def set_book
    @book= Book.find(params[:id])
  end
  def params_book
    params.require(:book).permit(:namebook,:nameauthor,:price,:description,:image)
  end

end
