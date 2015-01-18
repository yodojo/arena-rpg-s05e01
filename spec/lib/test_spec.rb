# encoding: UTF-8
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
		@arma_galho = Arma.new('Galho', 1, 1)
	end

	it "Criar a arena 20x20" do
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
		personagem = Personagem.new('Leonidas', @arma_espada, 200)

		expect(personagem.nome).to eq('Leonidas')
		expect(personagem.arma).to eq(@arma_espada)
		expect(personagem.hp).to eq(200)
		
	end


	it "Se estao em combate" do
		personagem1 = Personagem.new('Leonidas', @arma_espada, 200)
		personagem2 = Personagem.new('Hulk', @arma_lanca, 800)

		@arena.add_personagem(personagem1, 4, 6)
		@arena.add_personagem(personagem2, 5, 7)


		arena_combate = @arena.em_combate?(personagem1, personagem2)

		expect(arena_combate).to be_truthy
	end


	it "Se nao estao em combate" do
		
		personagem1 = Personagem.new('Leonidas', @arma_espada, 200)
		personagem2 = Personagem.new('Hulk', @arma_lanca, 800)

		@arena.add_personagem(personagem1, 8, 8)
		@arena.add_personagem(personagem2, 5, 7)

		arena_combate = @arena.em_combate?(personagem1, personagem2)
		
		expect(arena_combate).to be_falsey
	end


	it "Se pode atacar" do 

		personagem1 = Personagem.new('Leonidas', @arma_espada, 200)
		personagem2 = Personagem.new('Hulk', @arma_flecha, 800)

		@arena.add_personagem(personagem1, 7, 8)
		@arena.add_personagem(personagem2, 5, 7)


		#espada sem distancia para atacar
		expect(@arena.pode_atacar(personagem1, personagem2)).to be_falsey
		#arco com distancia pra atacar
		expect(@arena.pode_atacar(personagem2, personagem1)).to be_truthy

	end

	it "Deve atacar personagem" do 

		personagem1 = Personagem.new('Leonidas', @arma_flecha, 200)
		personagem2 = Personagem.new('Hulk', @arma_lanca, 800)

		@arena.add_personagem(personagem1, 8, 8)
		@arena.add_personagem(personagem2, 5, 7)
		
		personagem1.atacar(personagem2)
		expect(personagem2.hp).to eq(790)
	end


	it "Se estão dentro da arena" do
		personagem = Personagem.new('Leonidas', @arma_espada, 200)
		@arena.add_personagem(personagem, 8, 8)
		na_arena = @arena.na_arena?(personagem)

		expect(na_arena).to be_truthy
	end

	it "Se estão fora da arena" do
		personagem = Personagem.new('Leonidas', @arma_espada, 200)
		na_arena = @arena.na_arena?(personagem)

		expect(na_arena).to be_falsey
	end

	it "Efetuar movimento válido" do
		personagem = Personagem.new('Leonidas', @arma_espada, 200)

		@arena.add_personagem(personagem , 8, 8)
		
		moveu = @arena.mover(personagem, 6, 7)
		expect(moveu).to be_truthy
		expect(personagem.x).to eq(6)
		expect(personagem.y).to eq(7)
	end

	it "Apos ataque maior ou igual a vida, deve morrer" do

		personagem1 = Personagem.new('Leonidas', @arma_espada, 200)
		personagem2 = Personagem.new('João Bobo', @arma_galho, 30)

		@arena.add_personagem(personagem1, 5, 8)
		@arena.add_personagem(personagem2, 5, 7)
		
		#primeiro ataque não mata
		personagem1.atacar(personagem2)
		expect(personagem2.esta_vivo).to be_truthy

		#segundo ataque mata
		personagem1.atacar(personagem2)
		expect(personagem2.esta_vivo).to be_falsey

	end


	it "Efetuar movimento inválido" do
		personagem = Personagem.new('Leonidas', @arma_espada, 200)
		@arena.add_personagem(personagem , 8, 8)

		moveu = @arena.mover(personagem, 21, 3)
		expect(moveu).to be_falsey
		expect(personagem.x).to eq(8)
		expect(personagem.y).to eq(8)
	end

end

