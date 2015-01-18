class Arena
	attr_accessor :width, :height
	def initialize(width, height)
		@width = width
		@height = height

		@personagens = []
	end

	def matriz_area
		@area = {}
		(1..@width).each do |block_horizontal|
			@area[block_horizontal] = []

			(1..@height).each do |block_vertical|
				@area[block_horizontal] << { block_horizontal => block_vertical }
			end
		end

		@area
	end

	def em_combate?(personagem_1, personagem_2)
		distancia = self.distancia(personagem_1,personagem_2)
		maior_distancia = [personagem_1.arma.distancia, personagem_2.arma.distancia].max
		(distancia(personagem_1,personagem_2) < maior_distancia)
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

	def dentro_arena?(x, y)
		x.between? 1, @width and y.between? 1, @height
	end

	def na_arena?(personagem)
		self.dentro_arena? personagem.x, personagem.y
	end

	def mover(personagem, x, y)
		if self.dentro_arena? x, y
			personagem.x = x
			personagem.y = y
			return true
		end

		false
	end

end
