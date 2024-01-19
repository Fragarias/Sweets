class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @new_items = Item.order('id DESC').limit(4)
  end
end
