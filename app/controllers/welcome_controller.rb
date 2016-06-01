class WelcomeController < ApplicationController
  def index
  end

  def new
  	
  	@Persona = Persona.new
	@Persona.usuarios.build
  end

  def create

  	#@Persona=Persona.new(param)
  	@Persona=Persona.new
  	@Usuario=Usuario.new

  	@Persona.name=param[:name]
  	@Persona.lasname=param[:lasname]

  	@Usuario.user=param[:usuarios_attributes]["0"][:user]
  	@Usuario.pasword=param[:usuarios_attributes]["0"][:pasword]

  	@Usuario.persona=@Persona
  	puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  	puts "Usuario: "+@Usuario.user.to_s
  	puts "Pasword: "+@Usuario.pasword.to_s
  	
  	if @Usuario.save
  		redirect_to :controller=>"welcome", :action=>"index"
  	else
  		render "new"
  	end
  	
  end

  def param
  	params.require(:persona).permit(:name,:lasname,:usuarios_attributes => [:user, :pasword]);
  	
  end



end