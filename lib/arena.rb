class Arena
	attr_accessor :width, :height
	def initialize(width, height)
		@width = width
		@height = height
		@area = [0..@width][0..@height]
		@personagens = []
	end

	def em_combate?(personagem_1, personagem_2)
		distancia = self.distancia(personagem_1,personagem_2)
		maior_distancia = [personagem_1.arma.distancia, personagem_2.arma.distancia].max
		(distancia(personagem_1,personagem_2) < maior_distancia) ? true : false
	end

	def distancia(personagem_1,personagem_2)
		a = (personagem_1.x - personagem_2.x)**2
		b = (personagem_1.y - personagem_2.y)**2
		Math.sqrt(a+b)
	end

	def add_personagem(personagem, x, y)
		personagens.append(personagem)
		personagem.x = x
		personagem.y = y
	end

	def mover(personagem, x, y)
		personagem = personagem
		personagem.x = x
		personagem.y = y
	end
end