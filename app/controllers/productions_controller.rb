class ProductionsController < ApplicationController
  # GET /productions
  # GET /productions.json
  def index
    @productions = Production.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productions }
    end
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
    @production = Production.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production }
    end
  end

  # GET /productions/new
  # GET /productions/new.json
  def new
    @production = Production.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production }
    end
  end

  # GET /productions/1/edit
  def edit
    @production = Production.find(params[:id])
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(params[:production])

    respond_to do |format|
      if @production.save
        format.html { redirect_to @production, notice: 'Production was successfully created.' }
        format.json { render json: @production, status: :created, location: @production }
      else
        format.html { render action: "new" }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productions/1
  # PUT /productions/1.json
  def update
    @production = Production.find(params[:id])

    respond_to do |format|
      if @production.update_attributes(params[:production])
        format.html { redirect_to @production, notice: 'Production was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production = Production.find(params[:id])
    @production.destroy

    respond_to do |format|
      format.html { redirect_to productions_url }
      format.json { head :no_content }
    end
  end
end
