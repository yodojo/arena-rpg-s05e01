require 'personagem'
require 'arena'

class ArenaPersonagemBinding
  attr_reader :personagens

  def initialize(arena)
    @arena = arena
    @personagens = []
  end

  def add_personagem_na_arena(personagem, coordenada)
    @personagens << personagem
    move_personagem personagem, coordenada
  end

  def move_personagem(personagem, coordenada)
    coordenada_x = coordenada.x > @arena.width  ? @arena.width  : coordenada.x 
    coordenada_y = coordenada.y > @arena.height ? @arena.height : coordenada.y 
    coordenada_x = 1 if coordenada_x < 0
    coordenada_y = 1 if coordenada_y < 0

    personagem.move_para coordenada_x, coordenada_y
  end
end