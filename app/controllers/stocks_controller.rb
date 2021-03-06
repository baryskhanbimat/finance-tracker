class StocksController < ApplicationController
  # def search
  #   if params[:stock].present?
  #     @stock = Stock.new_from_lookup(params[:stock])
  #     if @stock
  #       # render partial: 'users/result'
  #       respond_to do |format|
  #         format.js { render partial: 'users/result' }
  #       end
  #     else
  #       respond_to do |format|
  #         flash.now[:danger] = 'You have entered an incorrect symbol'
  #         format.js { render partial: 'users/result' }
  #       end
  #
  #       # render partial: 'users/result'
  #     end
  #
  #   else
  #     respond_to do |format|
  #       flash.now[:danger] = 'You have entered an empty string'
  #       format.js { render partial: 'users/result' }
  #     end
  #   end
  #
  # end

  def search
    if params[:stock].blank?
      flash.now[:danger] = 'You have entered an empty string'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = 'You have entered an incorrect symbol' unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end