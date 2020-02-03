class TestCasesController < ApplicationController
  before_action :set_test_case, only: [:show, :edit, :update, :destroy]

  # GET /test_cases
  # GET /test_cases.json
  def index
    logger.debug("SESSION OBJECT #{session[:enviro_id].inspect}")
    id = session[:enviro_id]
    @t = TestSuite.where(environment_id: id).pluck(:id)
    logger.debug("TEST SUITE #{@t.inspect}")
    if @t.present?
      @test_cases = Array.new
      @t.each do |t_id|
        tc_ids = TestSuite.find(t_id).test_cases
        if tc_ids.present?
          @ids = tc_ids.pluck(:id) 
          @test_cases = TestCase.find(@ids)
        logger.debug("TEST SUITES ARE #{@test_cases}")
      end
      end
    else
      
    end
  end

  # GET /test_cases/1
  # GET /test_cases/1.json
  def show
  end

  # GET /test_cases/new
  def new
    @test_case = TestCase.new
  end

  # GET /test_cases/1/edit
  def edit
  end

  # POST /test_cases
  # POST /test_cases.json
  def create
    @test_case = TestCase.new(test_case_params)

    respond_to do |format|
      if @test_case.save
        format.html { redirect_to @test_case, notice: 'Test case was successfully created.' }
        format.json { render :show, status: :created, location: @test_case }
      else
        format.html { render :new }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_cases/1
  # PATCH/PUT /test_cases/1.json
  def update
    respond_to do |format|
      if @test_case.update(test_case_params)
        format.html { redirect_to @test_case, notice: 'Test case was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_case }
      else
        format.html { render :edit }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_show
    @test_case = TestCase.all
    respond_to do |format|
      format.html
      format.js
    end 
  end

  # DELETE /test_cases/1
  # DELETE /test_cases/1.json
  def destroy
    @test_case.destroy
    respond_to do |format|
      format.html { redirect_to test_cases_url, notice: 'Test case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_case
      @test_case = TestCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_case_params
      params.require(:test_case).permit(:field_name, :field_type, :read_element, :base_url, :input_value, :string, :action, :action_url, :base_url, :dependency, :login, :sleeps, :new_tab, :description, :need_screenshot, :xpath, test_suite_ids: [])
    end
end
