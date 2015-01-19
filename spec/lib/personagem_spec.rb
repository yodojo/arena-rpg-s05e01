require 'spec_helper'
require 'personagem'

describe Personagem do
  before do
    espada = double('Arma', nome: 'espada', distancia: 1, dano: 20)
    @leonidas = Personagem.new('Leonidas', espada, 200)
    @hulk = Personagem.new('Hulk', nil, 800)
  end

  it 'deveria estar vivo' do
    expect(@leonidas.esta_vivo?).to be_truthy
  end

  it 'deveria atacar outro personagem' do
    @leonidas.ataca @hulk

    expect(@hulk.hp).to eq(780)
  end

  it 'deveria estar armado' do
    expect(@leonidas.esta_armado?).to be_truthy
  end

  it 'deveria não estar armado' do
    expect(@hulk.esta_armado?).to be_falsey
  end

  it 'deveria estar atingível' do
    @leonidas.move_para 1, 2
    chuck_noris = double('Personagem', x: 1, y: 1)

    expect(@leonidas.esta_atingivel?(chuck_noris)).to be_truthy
  end

  it 'deveria estar não atingível' do
    @leonidas.move_para 4, 4
    chuck_noris = double('Personagem', x: 1, y: 1)

    expect(@leonidas.esta_atingivel?(chuck_noris)).to be_falsey
  end

  it 'deveria se mover de um ponto a outro' do
    @leonidas.move_para 1, 1
    @leonidas.move_para 4, 5

    expect(@leonidas.x).to eq(4)
    expect(@leonidas.y).to eq(5)
  end
end