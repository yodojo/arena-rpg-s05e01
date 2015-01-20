class Arma
	attr_reader :nome, :distancia, :dano
	
	def initialize(nome, distancia, dano)
		@nome = nome
		@distancia = distancia
		@dano = dano
	end
end