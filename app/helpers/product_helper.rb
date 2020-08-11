module ProductHelper
  def product_author(book)
    logged_in? && current_user.id == book.user_id
  end
end
