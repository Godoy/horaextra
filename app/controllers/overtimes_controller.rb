class OvertimesController < ApplicationController

  # GET /overtimes
  # GET /overtimes.json
  def index
    @overtimes = current_user.overtimes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @overtimes }
    end
  end


  def new
  	@overtime = Overtime.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @overtime }
    end
  end


  # GET /overtime/1
  # GET /overtime/1.json
  def show
    @overtime = Overtime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @overtime }
    end
  end


  # POST /overtimes
  # POST /overtimes.json
  def create
    @overtime = Overtime.new(params[:overtime])
    @overtime.user = current_user

    respond_to do |format|
      if @overtime.save
        format.html { redirect_to "/registrar-hora-extra", notice: 'Hora extra registrada com sucesso.' }
        format.json { render json: @overtime, status: :created, location: @overtime }
      else
        format.html { render action: "index" }
        format.json { render json: @overtime.errors, status: :unprocessable_entity }
      end
    end
  end


end
