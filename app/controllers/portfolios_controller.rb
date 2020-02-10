class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def python
    @python_portfolio_items = Portfolio.python
  end

  def

  def new
    @portfolio_items = Portfolio.new
  end

  def edit
    @portfolio_items = Portfolio.find(params[:id])
  end

  def show
    @portfolio_items = Portfolio.find(params[:id])
  end

  def create
    @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title,
      :subtitle, :body))
    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is Now Live!' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @portfolio_items = Portfolio.find(params[:id])
    @portfolio_items.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Item was removed.' }
    end
  end

  def update
    @portfolio_items = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_items.update(params.require(:portfolio).permit(:title,
        :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
end
