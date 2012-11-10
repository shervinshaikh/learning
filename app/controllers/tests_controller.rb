class TestsController < ApplicationController
  #load_and_authorize_resource
  before_filter :direct_to

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tests }
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @test = Test.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test }
    end
  end

  # GET /tests/new
  # GET /tests/new.json
  def new
    @test = Test.new
    @subjects = []
    @quarters = []
    courses = Course.all
    courses.each do |s|
      @subjects << s.subject if s.subject
      @quarters << s.quarter if s.quarter
    end
    #@subjects = [Course.first.subject]
    #@quarters = ['Fall 2012']
    @grades = ['A+','A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-']

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test }
    end
  end

  # GET /tests/1/edit
  def edit
    @test = Test.find(params[:id])
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(params[:test])

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render json: @test, status: :created, location: @test }
      else
        format.html { render action: "new" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.json
  def update
    @test = Test.find(params[:id])

    respond_to do |format|
      if @test.update_attributes(params[:test])
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test = Test.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end


  private
    def direct_to
      if current_user.has_role? :new
        redirect_to edit_user_registration_path
        flash[:error] = "Contact Shervin for access to files"
      end
    end
end
