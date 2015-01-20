require 'spec_helper'
require 'binding'
require 'arma'
require 'arena'
require 'coordenada'

describe ArenaPersonagemBinding do
  before do
    espada = Arma.new 'espada', 1, 20
    @leonidas = Personagem.new 'Leonidas', espada, 200
    @arena = Arena.new 20, 20
    @binding = ArenaPersonagemBinding.new @arena
  end

  it 'deveria adicionar um personagem na arena' do
    @binding.add_personagem_na_arena @leonidas, Coordenada.new(5, 5)

    expect(@leonidas.x).to be_between(1, @arena.width)
    expect(@leonidas.y).to be_between(1, @arena.height)
    expect(@binding.personagens).to be_include(@leonidas)
  end

  it 'deveria mover o personagem ao longo da arena' do
    @binding.move_personagem @leonidas, Coordenada.new(4, 5)

    expect(@leonidas.x).to eq(4)
    expect(@leonidas.y).to eq(5)
  end

  it 'deveria mover o personagem até o limite do largura da arena quando movimento o levaria para fora' do
    @binding.move_personagem @leonidas, Coordenada.new(24, 10)

    expect(@leonidas.x).to eq(20)
    expect(@leonidas.y).to eq(10)
  end

  it 'deveria mover o personagem até o limite do altura da arena quando movimento o levaria para fora' do
    @binding.move_personagem @leonidas, Coordenada.new(15, 30)

    expect(@leonidas.x).to eq(15)
    expect(@leonidas.y).to eq(20)
  end

  it 'deveria mover o personagem até o limite da arena quando movimento o levaria para fora' do
    @binding.move_personagem @leonidas, Coordenada.new(-10, 30)

    expect(@leonidas.x).to eq(1)
    expect(@leonidas.y).to eq(20)
  end
end