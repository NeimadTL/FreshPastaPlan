class CatalogController < ApplicationController

  def index
    @pastas = Pasta.all
  end

end
