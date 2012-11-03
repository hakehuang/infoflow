class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json

  def index
    @searchable = 1
    @options = Project.attribute_names
    @default = @options[1]
    if ! params[:id].nil?
      @projects = Project.where("id" +  " LIKE :range", :range => "%" +  params[:id] + "%").paginate(:page => params[:page], :per_page => 5)
    else
    @projects = Project.paginate(:page => params[:page], :per_page => 5)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end
  
  def sub_path
    case params[:name]
      when "contract_id"
      redirect_to contracts_path(:id=>params[:id]), notice => "to contract"
      when "user_id"
      redirect_to users_path(:id=>params[:id]), notice => "to contract"
      when "id"
      redirect_to projects_path(:id=>params[:id]), notice => "to contract"
      else
      return
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    if params[:contract].nil?
      redirect_to dashboard_project_path, :notice => "contract info missing"
      return
    end
    #@oldcntr = Contract.find(:all, :conditions => {:No => params[:contract]})
    @oldcntr = Contract.find(params[:contract])
    @projects = Project.find(:all, :conditions => {:contract_id => @oldcntr.id})
    if @projects.count > 0
      redirect_to dashboard_project_path, :notice => "project has created for this contract"
      return
    end

    @project = Project.new
    @project.user_id = current_user.id
    @project.contract_id = params[:contract]

    respond_to do |format|
      if @project.save
        format.html { redirect_to dashboard_project_path(@project) , :notice => "create project" }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end

     # format.html # new.html.erb
     # format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
