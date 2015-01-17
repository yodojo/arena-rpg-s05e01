class Personagem
	attr_accessor :nome, :arma, :hp, :x, :y
	def initialize(nome, arma, hp, x, y)
		@nome = nome
		@arma = arma
		@x = x
		@y = y
		@hp = hp
	end

	def atacar(personagem)
	end
end