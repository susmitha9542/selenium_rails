class ResultCasesController < ApplicationController
  before_action :set_result_case, only: [:show, :edit, :update, :destroy]

  # GET /result_cases
  # GET /result_cases.json
  def index
    @result_cases = ResultCase.all
  end

  # GET /result_cases/1
  # GET /result_cases/1.json
  def show
  end

  # GET /result_cases/new
  def new
    @result_case = ResultCase.new
  end

  # GET /result_cases/1/edit
  def edit
  end

  # POST /result_cases
  # POST /result_cases.json
  def create
    @result_case = ResultCase.new(result_case_params)

    respond_to do |format|
      if @result_case.save
        format.html { redirect_to @result_case, notice: 'Result case was successfully created.' }
        format.json { render :show, status: :created, location: @result_case }
      else
        format.html { render :new }
        format.json { render json: @result_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_cases/1
  # PATCH/PUT /result_cases/1.json
  def update
    respond_to do |format|
      if @result_case.update(result_case_params)
        format.html { redirect_to @result_case, notice: 'Result case was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_case }
      else
        format.html { render :edit }
        format.json { render json: @result_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_cases/1
  # DELETE /result_cases/1.json
  def destroy
    @result_case.destroy
    respond_to do |format|
      format.html { redirect_to result_cases_url, notice: 'Result case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_case
      @result_case = ResultCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_case_params
      params.require(:result_case).permit(:rd_id, :test_case_id, :result_suite_id)
    end
end
