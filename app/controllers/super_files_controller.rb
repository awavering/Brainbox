class SuperFilesController < ApplicationController
  # GET /super_files
  # GET /super_files.json
  def index
    @super_files = SuperFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @super_files }
    end
  end

  # GET /super_files/1
  # GET /super_files/1.json
  def show
    @super_file = SuperFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @super_file }
    end
  end

  # GET /super_files/new
  # GET /super_files/new.json
  def new
    @super_file = SuperFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @super_file }
    end
  end

  # GET /super_files/1/edit
  def edit
    @super_file = SuperFile.find(params[:id])
  end

  # POST /super_files
  # POST /super_files.json
  def create
    @super_file = SuperFile.new(params[:super_file])

    respond_to do |format|
      if @super_file.save
        format.html { redirect_to @super_file, notice: 'Super file was successfully created.' }
        format.json { render json: @super_file, status: :created, location: @super_file }
      else
        format.html { render action: "new" }
        format.json { render json: @super_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /super_files/1
  # PUT /super_files/1.json
  def update
    @super_file = SuperFile.find(params[:id])

    respond_to do |format|
      if @super_file.update_attributes(params[:super_file])
        format.html { redirect_to @super_file, notice: 'Super file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @super_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_files/1
  # DELETE /super_files/1.json
  def destroy
    @super_file = SuperFile.find(params[:id])
    @super_file.destroy

    respond_to do |format|
      format.html { redirect_to super_files_url }
      format.json { head :no_content }
    end
  end
end
