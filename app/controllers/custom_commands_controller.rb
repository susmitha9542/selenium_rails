class CustomCommandsController < ApplicationController

	def create
		@custom_command = CustomCommand.create(custom_command_params)
		@custom_command.environment_id = params[:environment_id]
		@custom_command.parameters = params[:parameters].join(',')
		@custom_command.save
	end

	def show
		logger.debug("PARAMS IN SHOW #{params.inspect}")
	end 

	def custom_commands
    
  	end

  	def edit
  		logger.debug("PARAMS IN EDIT #{params.inspect}")
  		@id = params[:id]
  		@custom = CustomCommand.where(environment_id: @id)
  	end

  	def update
  		logger.debug("PARAMS OF UPDATE")
  	end

	private

	def custom_command_params
		params.require(:custom_command).permit(:name, :command, :parameters)
	end

end
