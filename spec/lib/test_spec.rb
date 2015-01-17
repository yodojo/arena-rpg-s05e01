require "spec_helper"
require "arena"
require "personagem"
require "arma"

describe "Combate arena" do 

	before do
		@arena = Arena.new(20, 20)
		@arma_espada = Arma.new('Espada', 1, 20)
		@arma_lanca = Arma.new('Lança', 3, 15)
		@arma_flecha = Arma.new('Flecha', 5, 10)
	end

	it "Criar a arena 20x20" do
		# arena = Arena.new(20, 20)
		expect(@arena.width).to eq(20)
		expect(@arena.height).to eq(20)
	end

	it "Criar arma tipo espada" do
		expect(@arma_espada.distancia).to eq(1)
		expect(@arma_espada.dano).to eq(20)
	end

	it "Criar arma tipo lança" do
		expect(@arma_lanca.distancia).to eq(3)
		expect(@arma_lanca.dano).to eq(15)
	end

	it "Criar arma tipo flecha" do
		expect(@arma_flecha.distancia).to eq(5)
		expect(@arma_flecha.dano).to eq(10)
	end

	it "Criar personagens" do
		personagem = Personagem.new('Leonidas', @arma_espada, 200, 3, 2)

		expect(personagem.nome).to eq('Leonidas')
		expect(personagem.arma).to eq(@arma_espada)
		expect(personagem.hp).to eq(200)
		expect(personagem.x).to eq(3)
		expect(personagem.y).to eq(2)
	end

	it "Se estao em combate" do
		personagem1 = Personagem.new('Leonidas', @arma_espada, 200, 4, 6)
		personagem2 = Personagem.new('Hulk', @arma_lanca, 800, 5, 7)

		arena_combate = @arena.em_combate?(personagem1, personagem2)

		expect(arena_combate).to be_truthy
	end

	it "Se nao estao em combate" do
		armaDoPersonagem1 = Arma.new('Espada', 1, 20)
		personagem1 = Personagem.new('Leonidas', armaDoPersonagem1, 200, 8, 8)
		
		armaDoPersonagem2 = Arma.new('Lança', 3, 15)
		personagem2 = Personagem.new('Hulk', armaDoPersonagem2, 800, 5, 7)

		arena_combate = @arena.em_combate?(personagem1, personagem2)

		expect(arena_combate).to be_falsey
	end

	it "Se estão fora da arena"

	it "Se pode atacar"

	it "Deve mover personagem" do
		personagem = Personagem.new('Leonidas', @arma_espada, 200, 8, 8)

		@arena.mover(personagem, 6, 7)
		expect(personagem.x).to eq(6)
		expect(personagem.y).to eq(7)
	end

end