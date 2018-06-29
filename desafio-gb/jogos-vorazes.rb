Neutro = 0
Katanis = 1
Item = 3

class Inimigo
  def initialize()
    @itens = 0
  end

  def add_item()
    @itens = @itens + 1
  end

  def num_itens()
    @itens
  end

  def to_s
   '2'
  end
end


class Game
  def initialize()
    @mapa = gerar_mapa
    @katanis_x = 0
    @katanis_y = 0
    @katanis_itens = 0
  end

  def gerar_mapa
    [[Katanis, Neutro, Item, Neutro, Neutro],
    [Neutro, Neutro, Inimigo.new, Neutro, Inimigo.new],
    [Inimigo.new, Neutro, Neutro, Neutro, Neutro],
    [Neutro, Neutro, Neutro, Neutro, Neutro],
    [Neutro, Neutro, Neutro, Neutro, Neutro]]
  end

  def mover(x, y)
    if @mapa[x][y].instance_of?(Inimigo)
      if @mapa[x][y].num_itens() > @katanis_itens
        abort("VOCE PERDEU")
      end
    elsif @mapa[x][y] == Item
      @katanis_itens = @katanis_itens + 1
    end
    @mapa[@katanis_x][@katanis_y] = Neutro
    @mapa[x][y] = Katanis
    @katanis_x = x
    @katanis_y = y
    print_mapa
    mover_inimigos
  end

  def mover_inimigos
    temp_matrix = Marshal.load(Marshal.dump(@mapa))
    for i in 0..4
      for j in 0..4
        if @mapa[i][j].instance_of?(Inimigo)
          direction = Random.new.rand(0..3)
          if direction == 0 # norte
            if i > 0 and !@mapa[i - 1][j].instance_of?(Inimigo)
              if @mapa[i - 1][j] == Item
                @mapa[i][j].add_item()
                temp_matrix[i - 1][j] = @mapa[i][j]
                temp_matrix[i][j] = Neutro
              elsif @mapa[i - 1][j] == Katanis and @mapa[i][j].num_itens() > @katanis_itens
                abort("VOCE PERDEU")
              elsif @mapa[i - 1][j] == Katanis and @mapa[i][j].num_itens() <= @katanis_itens
                temp_matrix[i][j] = Neutro
              else
                temp_matrix[i - 1][j] = @mapa[i][j]
                temp_matrix[i][j] = Neutro
              end
            end
          end
          # Sul
          if direction == 1 # sul
            if i < 4 and !@mapa[i + 1][j].instance_of?(Inimigo)
              if @mapa[i + 1][j] == Item
                @mapa[i][j].add_item()
                temp_matrix[i + 1][j] = @mapa[i][j]
                temp_matrix[i][j] = Neutro
              elsif @mapa[i + 1][j] == Katanis and @mapa[i][j].num_itens() > @katanis_itens
                abort("VOCE PERDEU")
              elsif @mapa[i + 1][j] == Katanis and @mapa[i][j].num_itens() <= @katanis_itens
                temp_matrix[i][j] = Neutro
              else
                temp_matrix[i + 1][j] = @mapa[i][j]
                temp_matrix[i][j] = Neutro
              end
            end
          end
          # Leste
          if direction == 2 # leste
            if j < 4 and !@mapa[i][j + 1].instance_of?(Inimigo)
              if @mapa[i][j + 1] == Item
                @mapa[i][j].add_item()
                temp_matrix[i][j + 1] = @mapa[i][j]
                temp_matrix[i][j] = Neutro
              elsif @mapa[i][j + 1] == Katanis and @mapa[i][j].num_itens() > @katanis_itens
                abort("VOCE PERDEU")
              elsif @mapa[i][j + 1] == Katanis and @mapa[i][j].num_itens() <= @katanis_itens
                temp_matrix[i][j] = Neutro
              else
                temp_matrix[i][j + 1] = @mapa[i][j]
                temp_matrix[i][j] = Neutro
              end
            end
          end
          # Oeste
          if direction == 3 # oeste
            if j > 0 and !@mapa[i][j - 1].instance_of?(Inimigo)
              if @mapa[i][j - 1] == Item
                @mapa[i][j].add_item()
                temp_matrix[i][j - 1] = @mapa[i][j]
                temp_matrix[i][j] = Neutro
              elsif @mapa[i][j - 1] == Katanis and @mapa[i][j].num_itens() > @katanis_itens
                abort("VOCE PERDEU")
              elsif @mapa[i][j - 1] == Katanis and @mapa[i][j].num_itens() <= @katanis_itens
                temp_matrix[i][j] = Neutro
              else
                temp_matrix[i][j - 1] = @mapa[i][j]
                temp_matrix[i][j] = Neutro
              end
            end
          end
        end
      end
    end
    @mapa = temp_matrix
  end

  def print_mapa
    @mapa.each do |linha|
      linha.each do |value|
        print "#{value} "
      end
      puts ''
    end
  end
end

def game_loop
  game = Game.new
  game.print_mapa
  tentativas = Random.new.rand(8..24)
  acertos = 0

  for tentativa in 1..tentativas
    puts 'Digite a cordenada x: '
    x = gets.chomp.to_i
    x = x -1
    puts 'Digite a cordenada y: '
    y = gets.chomp.to_i
    y = y - 1
    system "clear"
    game.mover(x, y)
  end

  # Se o usuário não acertar no numero de tentativas sorteado, o monstro deve aparecer e o jogo acabar
  puts "GAME OVER"
  puts "\u{1F419}"
end

game_loop
