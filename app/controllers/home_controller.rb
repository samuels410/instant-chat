class HomeController < ApplicationController

  def index
    @dialect = Dialect.all
  end
end
