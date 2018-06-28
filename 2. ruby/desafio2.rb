class Game
  def initialize()
    @mapa = gerar_mapa
    @mapa_revelado = [["\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}"],
                      ["\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}"],
                      ["\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}", "\u{2753}"]]
    @acertos = 0
  end

  def gerar_mapa
    mapaNavios1 = [[0, 0, 0, 0, 2, 2, 0, 0],
                   [0, 0, 0, 0, 0, 0, 2, 2],
                   [3, 3, 3, 0, 0, 0, 0, 0]]

    mapaNavios2 = [[0, 0, 0, 0, 3, 3, 3, 0],
                   [0, 0, 2, 0, 0, 0, 0, 0],
                   [0, 0, 2, 0, 0, 2, 2, 0]]

    mapaNavios3 = [[3, 0, 2, 2, 0, 0, 0, 0],
                   [3, 0, 0, 0, 0, 0, 0, 0],
                   [3, 0, 0, 0, 2, 2, 0, 0]]

    sortear = [mapaNavios1, mapaNavios2, mapaNavios3]

    sortear[Random.new.rand(0..2)]
  end

  def atacar(x, y)
    if @mapa[x][y] != 0
      if @mapa_revelado[x][y] != "\u{1F4A5}"
        @mapa_revelado[x][y] = "\u{1F4A5}"
        @acertos = @acertos + 1
      end
      if @acertos == 7
        print_mapa
        abort("VOCE GANHOU")
      end
    else
      @mapa_revelado[x][y] = "\u{1F4A7}"
    end
    print_mapa
  end

  def print_mapa
    @mapa_revelado.each do |linha|
      linha.each do |value|
        print "#{value} "
      end
      puts ''
    end
  end
end

def game_loop
  game = Game.new

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
    game.atacar(x, y)
  end

  # Se o usuário não acertar no numero de tentativas sorteado, o monstro deve aparecer e o jogo acabar
  puts "GAME OVER"
  puts "\u{1F419}"
end

game_loop
