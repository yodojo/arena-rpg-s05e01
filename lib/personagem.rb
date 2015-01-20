class Personagem
  attr_accessor :hp
  attr_reader :nome, :arma, :x, :y

  def initialize(nome, arma, hp)
    @nome = nome
    @arma = arma
    @hp = hp
    @x = 0
    @y = 0
  end

  def move_para(x, y)
    @x = x
    @y = y
  end

  def esta_vivo? 
    hp > 0
  end

  def ataca(outro_personagem)
    raise "atacante necessita de uma arma" unless esta_armado? 
    outro_personagem.hp -= @arma.dano if esta_atingivel? outro_personagem
  end

  def esta_atingivel?(outro_personagem)
    raise "atacante necessita de uma arma" unless esta_armado? 
    distancia_ate(outro_personagem) <= @arma.distancia
  end

  def esta_armado?
    @arma
  end

  def distancia_ate(outro_personagem)
    a = (@x - outro_personagem.x)**2
    b = (@y - outro_personagem.y)**2
    Math.sqrt(a + b)
  end
end
