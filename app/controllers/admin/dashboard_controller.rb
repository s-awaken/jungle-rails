class Admin::DashboardController < ApplicationController
  before_filter :authorize

  http_basic_authenticate_with name: ENV['HTTP_BASIC_AUTH_NAME'], password: ENV['HTTP_BASIC_AUTH_PASSWORD']

  def show
    @totalProduct = Product.count
    @totalCategories = Category.count

  end
end
