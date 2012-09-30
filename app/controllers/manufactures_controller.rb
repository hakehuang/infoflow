class ManufacturesController < ApplicationController
  # GET /manufactures
  # GET /manufactures.json
  def index
    @manufactures = Manufacture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manufactures }
    end
  end

  # GET /manufactures/1
  # GET /manufactures/1.json
  def show
    @manufacture = Manufacture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manufacture }
    end
  end

  # GET /manufactures/new
  # GET /manufactures/new.json
  def new
    @manufacture = Manufacture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manufacture }
    end
  end

  # GET /manufactures/1/edit
  def edit
    @manufacture = Manufacture.find(params[:id])
  end

  # POST /manufactures
  # POST /manufactures.json
  def create
    @manufacture = Manufacture.new(params[:manufacture])

    respond_to do |format|
      if @manufacture.save
        format.html { redirect_to @manufacture, notice: 'Manufacture was successfully created.' }
        format.json { render json: @manufacture, status: :created, location: @manufacture }
      else
        format.html { render action: "new" }
        format.json { render json: @manufacture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manufactures/1
  # PUT /manufactures/1.json
  def update
    @manufacture = Manufacture.find(params[:id])

    respond_to do |format|
      if @manufacture.update_attributes(params[:manufacture])
        format.html { redirect_to @manufacture, notice: 'Manufacture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manufacture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufactures/1
  # DELETE /manufactures/1.json
  def destroy
    @manufacture = Manufacture.find(params[:id])
    @manufacture.destroy

    respond_to do |format|
      format.html { redirect_to manufactures_url }
      format.json { head :no_content }
    end
  end
end
