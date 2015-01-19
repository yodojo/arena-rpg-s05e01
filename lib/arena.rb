class Arena
	attr_reader :width, :height

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

	def add_personagem(personagem, x, y)
		@personagens.push(personagem)
		personagem.move_para(x, y)
		# personagem.x = x
		# personagem.y = y
		personagem.arena = self
	end

	def dentro_arena?(x, y)
		x.between? 1, @width and y.between? 1, @height	
	end

	def na_arena?(personagem)
		nos_limites = self.dentro_arena? personagem.x, personagem.y
		@personagens.include?(personagem) && nos_limites
	end
end
 