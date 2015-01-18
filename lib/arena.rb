class Arena
	attr_accessor :width, :height
	def initialize(width, height)
		@width = width
		@height = height
		@area = [1..@width][1..@height]
		@personagens = []
	end

	def em_combate?(personagem_1, personagem_2)
		distancia = self.distancia(personagem_1,personagem_2)
		maior_distancia = [personagem_1.arma.distancia, personagem_2.arma.distancia].max
		(distancia(personagem_1,personagem_2) < maior_distancia)
	end

	def distancia(personagem_1, personagem_2)
		a = (personagem_1.x - personagem_2.x)**2
		b = (personagem_1.y - personagem_2.y)**2
		Math.sqrt(a+b)
	end

	def add_personagem(personagem, x, y)
		@personagens.push(personagem)
		personagem.x = x
		personagem.y = y
		personagem.arena = self
	end

	def dentro_arena?(x, y)
		x.between? 1, @width and y.between? 1, @height	
	end

	def na_arena?(personagem)
		nos_limites = self.dentro_arena? personagem.x, personagem.y
		@personagens.include?(personagem) && nos_limites
	end

	def mover(personagem, x, y)
		if self.dentro_arena? x, y
			personagem.x = x
			personagem.y = y
			return true
		end

		false
	end
 
	def pode_atacar(atacante, atacado)
		distancia = self.distancia(atacante, atacado)		
		if atacante.arma.distancia >= distancia then 
			return true
		end	
		false
	end

	def atacar(atacante, atacado)
		if atacante.arma == nil then
		 raise "atacante necessita de uma arma"
		end
 
		if  self.pode_atacar(atacante, atacado) then
			atacado.hp -= atacante.arma.dano
		end
	end
end
 