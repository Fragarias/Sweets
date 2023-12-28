class Public::HomesController < ApplicationController
  def top
    @new_items = Item.order('id DESC').limit(4)
  end
end
