class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customer = Customer.page(params[:page])
  end
end
