class DiscountController < ApplicationController

  # GET /overtimes
  # GET /overtimes.json
  def discount
    @discount = current_user.discount.all
    @overtimes = current_user.overtimes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discount }
    end
  end
end