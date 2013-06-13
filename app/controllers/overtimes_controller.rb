class OvertimesController < ApplicationController

  # GET /overtimes
  # GET /overtimes.json
  def index
    @overtimes = current_user.overtimes.all
    @discount = current_user.discount.all

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
    
    #flash[:notice] = "Parabens sua hora extra foi criada"
    

    respond_to do |format|
      if @overtime.save
       Notification.registration_confirm(@overtime).deliver
        
        format.html { redirect_to "/registrar-hora-extra", notice: 'SUA HORA EXTRA FOI COMPUTADA, AGUARDE O GESTOR' }
        format.json { render json: @overtime, status: :created, location: @overtime }
      else
        format.html { render action: "new" }
        format.json { render json: @overtime.errors, status: :unprocessable_entity }
      end
    end
  end


  def approve
    #TODO:TROCAR ID POR HASH OU QUALQUER COISA CRIPTOGRAFADA OU TOKEN 
    #status gerar um campo com um default sempre pendente 
    overtime = Overtime.find(params[:id])
    overtime.status = 'approved'

    if overtime.save
      Notification.send_for_rh(overtime).deliver #notifica o RH
      Notification.your_overtime_approved(overtime).deliver #notifica o cara que registrou

      
      respond_to do |format|
        format.html 
        format.json { render json: @overtime }
      end
    else
      format.html { render action: "index" }
      format.json { render json: overtime.errors, status: :unprocessable_entity }
    end
  end

  def no_approved
    #logger.debug "TESTEEE" printar no console
    overtime = Overtime.find(params[:id])

    if overtime.save
      Notification.no_approved(overtime).deliver 

      respond_to do |format|
        format.html 
        format.json { render json: @overtime }
      end
    else
      format.html 
      format.json { render json: overtime.errors, status: :unprocessable_entity }
    end
  end
  def manager
    if params[:project_id].nil?
      @overtime = Overtime.all
      @total_times = (Overtime.SumOvertimes(current_user)/ 3600).to_i
    else
      @overtime = Overtime.where(:project_id => params[:project_id])
      @total_times = (Project.find(params[:project_id]).SumOvertimes/ 3600).to_i
    end

    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @overtimes }
    end
  end
  def rh
    @users = User.all

    if params[:id]
      @overtimes = User.find(params[:id]).overtimes.all
    else
      @overtimes = current_user.overtimes.all
    end
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @overtimes }
      format.csv { render text: @overtimes}
      format.xls { send_data @overtimes.to_csv(col_sep: "\t") }
    end
  end
end
