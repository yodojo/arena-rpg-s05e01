class Personagem
	attr_accessor :nome, :arma, :hp, :x, :y
	def initialize(nome, arma, hp, x, y)
		@nome = nome
		@arma = arma
		@hp = hp
		@x = x
		@y = y
	end

	def atacar(personagem)
	end
end
