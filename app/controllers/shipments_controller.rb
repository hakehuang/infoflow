class ShipmentsController < ApplicationController
  # GET /shipments
  # GET /shipments.json
  def index
    @searchable = 1
    @options = Project.attribute_names
    @default = @options[1]

    if ! params[:id].nil?
      @shipments = Shipment.where("id" +  " LIKE :range", :range => "%" +  params[:id] + "%").paginate(:page => params[:page], :per_page => 30)
    elsif ! params[:project].nil?
      @shipments = Shipment.where("project_id" +  " LIKE :range", :range => "%" +  params[:project] + "%").paginate(:page => params[:page], :per_page => 30)
    else
    @shipments = Shipment.paginate(:page => params[:page], :per_page => 30)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shipments }
    end
  end

  def sub_path
    case params[:name]
      when "id"
      redirect_to shipments_path(:id=>params[:id]), notice => "to shipment"
      when "project_id"
      redirect_to projects_path(:id=>params[:id]), notice => "to project"
      else
      return
    end
  end


  # GET /shipments/1
  # GET /shipments/1.json
  def show
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shipment }
    end
  end

  # GET /shipments/new
  # GET /shipments/new.json
  def new
    @shipment = Shipment.new
    if ! params[:project].nil?
      @shipment.project_id = params[:project]
    end    

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to dashboard_shipment_path(@shipment) , :notice => "create shipment" }
        format.xml  { render :xml => @shipment, :status => :created, :location => @shipment }
      else
        @isnew = 1
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /shipments/1/edit
  def edit
    @shipment = Shipment.find(params[:id])
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(params[:shipment])

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        format.json { render json: @shipment, status: :created, location: @shipment }
      else
        format.html { render action: "new" }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shipments/1
  # PUT /shipments/1.json
  def update
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      if @shipment.update_attributes(params[:shipment])
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy

    respond_to do |format|
      format.html { redirect_to shipments_url }
      format.json { head :no_content }
    end
  end
end
