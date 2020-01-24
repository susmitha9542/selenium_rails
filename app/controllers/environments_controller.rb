class EnvironmentsController < ApplicationController
  before_action :set_environment, only: [:show, :edit, :update, :destroy]

  # GET /environments
  # GET /environments.json
  def index
    @environments = Environment.all
  end

  # GET /environments/1
  # GET /environments/1.json
  def show
  end

  # GET /environments/new
  def new
    @environment = Environment.new
  end

  # GET /environments/1/edit
  def edit
  end

  # POST /environments
  # POST /environments.json
  def create
    @environment = Environment.new(environment_params)

    respond_to do |format|
      if @environment.save
        format.html { redirect_to @environment, notice: 'Environment was successfully created.' }
        format.json { render :show, status: :created, location: @environment }
      else
        format.html { render :new }
        format.json { render json: @environment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /environments/1
  # PATCH/PUT /environments/1.json
  def update
    respond_to do |format|
      if @environment.update(environment_params)
        format.html { redirect_to @environment, notice: 'Environment was successfully updated.' }
        format.json { render :show, status: :ok, location: @environment }
      else
        format.html { render :edit }
        format.json { render json: @environment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environments/1
  # DELETE /environments/1.json
  def destroy
    @environment.destroy
    respond_to do |format|
      format.html { redirect_to environments_url, notice: 'Environment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def test_suites
    @environment_id = params[:id]
    if @environment_id.present?
      @environment_name = Environment.find(@environment_id).name
      @test_suites = TestSuite.where(environment_id: @environment_id)
    else
      @test_suites = TestSuite.all
    end
  end

  def list_all_reports
    @schedule_cases = Scheduler.find(params[:id])
    @result_cases = ResultCase.where(scheduler_id: params[:id])
    respond_to do |format|  
      format.html{}
    end
  end

  def reports
    @test_suites = TestSuite.all
    @schedule = Scheduler.all
  end
  
  def run_suites
    if params[:suite].present?
      params[:suite].each do |s|
        logger.debug "CHECK CHECK SUITE SUITE #{s}"
        suite = TestSuite.find(s[0])
        schedule = Scheduler.new
        schedule.test_suite_id = s[0]
        schedule.scheduled_date = DateTime.now
        schedule.status = "READY"
        schedule.save!
        logger.debug "#{suite.id} #{suite.name}"
        # RUNSUITELOGIC put logic for running each test suite here.
      end
    else
      return redirect_to "/environments/#{session[:enviro_id]}/test_suites"
    end
    return redirect_to "/environments/#{session[:enviro_id]}/test_suites"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environment
      @environment = Environment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environment_params
      params.require(:environment).permit(:name, :url, :username, :password, :login_field, :password_field, :action_button,:default_suite_id, test_suite_ids: [])
    end
end
