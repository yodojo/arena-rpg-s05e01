class Personagem
	attr_accessor :nome, :arma, :hp, :x, :y, :arena
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
