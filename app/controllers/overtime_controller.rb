class OvertimeController < ApplicationController
  def index
  	@overtime = Overtime.new
  end
end
