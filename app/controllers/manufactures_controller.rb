class ManufacturesController < ApplicationController
  require 'will_paginate/array' 
  # GET /manufactures
  # GET /manufactures.json
  def index
    if ! params[:product].nil?
      @manufactures = Manufacture.find(:all, :joins => :products, :conditions => {:products => {:id => params[:product]}}).paginate(:page => params[:page], :per_page => 5) 
    else
      @manufactures = Manufacture.paginate(:page => params[:page], :per_page => 5)
    end
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

  def add_manufacture
    @manufacture = Manufacture.find(:all, :conditions => {:name => params[:add_manufacture] }) 
    @manufactures = Manufacture.find(@manufacture, :joins => :products, :conditions => {:products => {:id => params[:product][:id]}})
    if @manufactures.count > 0
      redirect_to products_path(:id => params[:product][:id]), :notice => "manufacture for this product is alread add"
      return
    end
    @join = ManufacturesProducts.new
    @join.product_id = params[:product][:id]
    @join.manufacture_id = @manufacture[0].id
    
      if @join.save
        redirect_to products_path(:id => params[:product][:id]), :notice => "add manufacture ok" 
      else
        redirect_to products_path(:id => params[:product][:id]), :notice => "add manufacture fail" 
      end

     
  end

  def add_product
    @product = Product.find(:all, :conditions => {:name => params[:add_product]})
    @products = Product.find(@product, :joins => :manufactures, :conditions => {:manufactures => {:id => params[:manufacture][:id]}})
    if @products.count > 0
      redirect_to dashboard_manufacture_path, :notice => "product is already add"
      return
    end
    @join = ManufacturesProducts.new
    @join.manufacture_id = params[:manufacture][:id]
    @join.product_id = @product[0].id
    
      if @join.save
        redirect_to dashboard_manufacture_path, :notice => "add product ok" 
      else
        redirect_to dashboard_manufacture_path, :notice => "add product fail" 
      end
      return
    rescue ActiveRecord::RecordNotFound
        redirect_to dashboard_manufacture_path, :notice => "add product no found" 
  end

  def add_new_product
    if params[:manufacture].nil?
      return
    end    
    
    @join = ManufacturesProducts.new 
    @product = Product.new
    @product.serial_no = "P" + Time.now.year.to_s + Time.now.month.to_s + Time.now.mday.to_s + rand(1000).to_s
    if @product.save
      @join.manufacture_id = params[:manufacture] 
      @join.product_id = @product.id
    else
      redirect_to dashboard_manufacture_path, :notice => "add new product fail" 
    end
    respond_to do |format|
      if @join.save
        format.html { redirect_to dashboard_product_path(@product) , :notice => "create product" }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end

  end

  # GET /manufactures/new
  # GET /manufactures/new.json
  def new
    
    @manufacture = Manufacture.new
    
    respond_to do |format|
      if @manufacture.save
        format.html { redirect_to dashboard_manufacture_path(@manufacture) , :notice => "create manufacture" }
        format.xml  { render :xml => @manufacture, :status => :created, :location => @manufacture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @manufacture.errors, :status => :unprocessable_entity }
      end
    end

 #   respond_to do |format|
 #     format.html # new.html.erb
 #     format.json { render json: @manufacture }
 #   end
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
