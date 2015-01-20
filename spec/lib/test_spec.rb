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
end

