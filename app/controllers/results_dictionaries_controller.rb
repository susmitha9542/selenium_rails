class ResultsDictionariesController < ApplicationController
  before_action :set_results_dictionary, only: [:show, :edit, :update, :destroy]

  # GET /results_dictionaries
  # GET /results_dictionaries.json
  def index
    @results_dictionaries = ResultsDictionary.all
  end

  # GET /results_dictionaries/1
  # GET /results_dictionaries/1.json
  def show
  end

  # GET /results_dictionaries/new
  def new
    @results_dictionary = ResultsDictionary.new
  end

  # GET /results_dictionaries/1/edit
  def edit
  end

  # POST /results_dictionaries
  # POST /results_dictionaries.json
  def create
    @results_dictionary = ResultsDictionary.new(results_dictionary_params)

    respond_to do |format|
      if @results_dictionary.save
        format.html { redirect_to @results_dictionary, notice: 'Results dictionary was successfully created.' }
        format.json { render :show, status: :created, location: @results_dictionary }
      else
        format.html { render :new }
        format.json { render json: @results_dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results_dictionaries/1
  # PATCH/PUT /results_dictionaries/1.json
  def update
    respond_to do |format|
      if @results_dictionary.update(results_dictionary_params)
        format.html { redirect_to @results_dictionary, notice: 'Results dictionary was successfully updated.' }
        format.json { render :show, status: :ok, location: @results_dictionary }
      else
        format.html { render :edit }
        format.json { render json: @results_dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results_dictionaries/1
  # DELETE /results_dictionaries/1.json
  def destroy
    @results_dictionary.destroy
    respond_to do |format|
      format.html { redirect_to results_dictionaries_url, notice: 'Results dictionary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_results_dictionary
      @results_dictionary = ResultsDictionary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def results_dictionary_params
      params.require(:results_dictionary).permit(:description)
    end
end
