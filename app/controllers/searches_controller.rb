class SearchesController < ApplicationController
  def new
    @search = Search.new
    @ministry = Gift.uniq.pluck(:office)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :ministry, :max_price, :successfull, :popular)
  end
end
