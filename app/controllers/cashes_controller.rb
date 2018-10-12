class CashesController < ApplicationController
  before_action :set_cash, only: [:show, :edit, :update, :destroy]

  # GET /cashes
  # GET /cashes.json

def entry
  @en= 2
   @search = params[:search]
    @cashes = Cash.new
    if @search
       @cashes = Cash.paginate(page:params[:page],per_page:7).where("concept||coin ILIKE ?", "%#{@search}%").where("register = '1'")

      @entry  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:entry)
     
      @entry_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:entry)
     
    elsif  request.format == "pdf"
        @cashes = Cash.where("register = '1'", "%#{@search}%").all
        
      
      @entry  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:entry)
     
      @entry_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:entry)

          
        else
            @cashes = Cash.where("register = '1'", "%#{@search}%").all
       

      
      @entry  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:entry)
     
      @entry_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:entry)
       @cashes = Cash.paginate(page:params[:page],per_page:7).where("register = '1'").all
      @cashes = Enterprise.all if request.format == "pdf"


   
      end

     respond_to do |format|

      format.html
      format.json
      format.pdf {render template: 'cashes/report', pdf: 'report', layout: 'pdf.html'}
    end
  
end

def egress
  @eg= 2
    @search = params[:search]
     @cashes = Cash.new
    if @search
       @cashes = Cash.paginate(page:params[:page],per_page:7).where("concept||coin ILIKE ?", "%#{@search}%").where("register = '2'")

      @egress  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:egress)
     
      @egress_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:egress)
     
    elsif  request.format == "pdf"
        @cashes = Cash.where("register = '2'").all
        
      
      @egress  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:egress)
     
      @egress_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:egress)

          
        else
            @cashes = Cash.where("register = '2'").all
       

      
      @egress  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:egress)
     
      @egress_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:egress)
       @cashes = Cash.paginate(page:params[:page],per_page:7).where("register = '2'").all
      @cashes = Enterprise.all if request.format == "pdf"

      end

     respond_to do |format|

      format.html
      format.json
      format.pdf {render template: 'cashes/report', pdf: 'report', layout: 'pdf.html'}
    end
  
end

  def index
  
     @search = params[:search]
     @cashes = Cash.new
    if @search
       @cashes = Cash.paginate(page:params[:page],per_page:7).where("concept||coin ILIKE ?", "%#{@search}%")
       @cashes = Cash.where("concept||coin ILIKE ?", "%#{@search}%") if request.format == "pdf"
  @egress  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:egress)
      @entry  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:entry)
      @egress_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:egress)
      @entry_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:entry)
      @t_dolar = @entry - @egress   
      @t_sol = @entry_s - @egress_s 
    else
    if  request.format == "pdf"

        @cashes = Cash.all
         @egress  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:egress)
      @entry  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:entry)
      @egress_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:egress)
      @entry_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:entry)
      @t_dolar = @entry - @egress   
      @t_sol = @entry_s - @egress_s 
        else
           @cashes = Cash.all
         @egress  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:egress)
      @entry  = @cashes.where("coin = 'DOLARES'", "%#{@search}%").sum(:entry)
      @egress_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:egress)
      @entry_s  = @cashes.where("coin = 'SOLES'", "%#{@search}%").sum(:entry)
      @t_dolar = @entry - @egress   
      @t_sol = @entry_s - @egress_s 
        @cashes = Cash.paginate(page:params[:page],per_page:7).all
        

      
        end

   
      end

     respond_to do |format|

      format.html
      format.json
      format.pdf {render template: 'cashes/report', pdf: 'report', layout: 'pdf.html'}
    end
  end

  # GET /cashes/1
  # GET /cashes/1.json
  def show
  end

  # GET /cashes/new
  def new

    @cash = Cash.new
  end


  # GET /cashes/1/edit
  def edit
    @select = true
    @edit = 1
  end

  # POST /cashes
  # POST /cashes.json
  def create
    @cash = Cash.new(cash_params)

    respond_to do |format|
      if @cash.save
        format.html {  redirect_to action: "index", notice: 'Cash was successfully created.' }
        format.json { render :show, status: :created, location: @cash }
      else
      render js: 'swal("Alerta", "Verificar todos los datos.", "warning");'
      end
    end
  end

  # PATCH/PUT /cashes/1
  # PATCH/PUT /cashes/1.json
  def update
    respond_to do |format|
      if @cash.update(cash_params)
        format.html { redirect_to action: "index", notice: 'Cash was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash }
      else
        format.html { render :edit }
        format.json { render json: @cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashes/1
  # DELETE /cashes/1.json
  def destroy
    @cash.destroy
    respond_to do |format|
      format.html { redirect_to cashes_url, notice: 'Cash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash
      @cash = Cash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_params
      params.require(:cash).permit(:concept, :coin, :entry, :egress, :register)
    end
end
