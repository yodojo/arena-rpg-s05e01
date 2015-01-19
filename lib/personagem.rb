class Personagem
	attr_accessor :x, :y, :arena, :hp
	attr_reader :nome, :arma

	def initialize(nome, arma, hp)
		@nome = nome
		@arma = arma
		@hp = hp
		@x = 0
		@y = 0
	end

	def atacar(personagem)
		 self.arena.atacar(self, personagem)
	end

	def esta_vivo 
		hp > 0
	end
end
