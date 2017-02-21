class NurseryController < ActionController::Base
  
  def products
    @class1 = "about"
    @class2 = "products"
  end
  
  def accreditations
    @class1 = "about"
    @class2 = "accreditations"
  end
  
  def gallery
    @class1 = "info"
    @class2 = "gallery"
    @images = Dir.glob("app/assets/images/carousel/*.jpg")
  end
  
  def history
    @class1 = "about"
    @class2 = "history"
  end
  
  def links
    @class1 = "info"
    @class2 = "links"
  end
  
  
  
   def index
     @class1 = "home"
   end
   
   def vines
     @class1 = "variety"
     @class2 = "vines"
       @vines = Vine.all
   end
   
   def rootstocks
     @class1 = "variety"
     @class2 = "rootstocks"
      @rootstocks = Rootstock.all
      
   end
   
   def planting
     @class1 = "info"
     @class2 = "planting"
   end
   
   

   
    def list
        @customer_orders = CustomerOrder.all
    end
  
  def review
    @class1 = "order"
    @customer_order = CustomerOrder.find(session[:order])
    

      
  end

def confirm
   @class1 = "order"
  @customer_order = CustomerOrder.new(session[:customer_order])
end

  # GET /customer_orders/new
  def order
    @years = Array.new
    @years[0] = Time.now.year
    @years[1] = Time.now.year + 1
    @years[2] = Time.now.year + 2
    @months = ['June', 'July', 'August', 'September', 'October', 'November', 'December']
    @class1 = "order"
    
    if session[:customer_order].blank?
      @customer_order = CustomerOrder.new
      @customer_order.vine_orders.build
    else
      @customer_order = CustomerOrder.new(session[:customer_order])
      if @customer_order.vine_orders.size == 0
        @customer_order.vine_orders.build
      end
    end
    @params = params
  end

  # GET /customer_orders/1/edit
  def edit
  end

  # POST /customer_orders
  # POST /customer_orders.json
  def submit
    @customer_order = CustomerOrder.new(session[:customer_order])
  @params = params
  session.delete(:customer_order)
  
    
      if @customer_order.save
        
        #CustomerMailer.new_order_email(@customer_order).deliver_now
        session[:order]=@customer_order.id
        @params = session[:order]
        redirect_to review_path
      else
       render :new
       end
    
  end
  
  def parse_order
    @customer_order = CustomerOrder.new(customer_order_params)
    if !session[:customer_order].blank?
      session.delete(:customer_order)
    end
  session[:customer_order] = customer_order_params
  
  if  @customer_order.valid?
    redirect_to :action => :confirm
  else  
    redirect_to :action => :order
  end
  end

  # PATCH/PUT /customer_orders/1
  # PATCH/PUT /customer_orders/1.json
  def update
        
    respond_to do |format|
      if @customer_order.update(customer_order_params)
        format.html { redirect_to @customer_order, notice: 'Customer order was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_order }
      else
        format.html { render :edit }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_orders/1
  # DELETE /customer_orders/1.json
  def destroy
    @customer_order.destroy
    respond_to do |format|
      format.html { redirect_to customer_orders_url, notice: 'Customer order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_order
      @customer_order = CustomerOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_order_params
      params.require(:customer_order).permit(:business_name, :address, :contact_person, :phone_number, :mobile_number, :email_address, :month, :year, vine_orders_attributes: [:variety, :clone, :rootstock, :quantity, :potted, :trimmed, :id, :_destroy
      ])
    end
end