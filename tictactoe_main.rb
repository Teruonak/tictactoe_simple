# author https://github.com/Teruonak

# configurações do jogo
gameName = "Jogo da Velha"
mGame = [1,2,3,4,5,6,7,8,9]
tryLeft = [1,2,3,4,5,6,7,8,9]
winning_rows = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
marker = [:C, :X].cycle
player1 = marker.next
player2 = marker.next
mPlayerGame = {player1 => [], player2 => []}

loop do # jogo
	gameOver ||= false
	player = marker.next

	# desenhar o jogo
	mGame.map.with_index { |element, index|
		print " #{element} "
		puts if (index + 1 ).to_i.modulo(3).zero?
	}

	# verifica se alguém ganhou
	winning_rows.each do |row|
		if (row & mPlayerGame[player1]).size.eql?(3)
			puts "Jogador 1 ganhou"
			gameOver = true
			break
		elsif (row & mPlayerGame[player2]).size.eql?(3)
			puts "Jogador 2 ganhou"
			gameOver = true
			break
		end
	end

	# verifica se deu empate
	if tryLeft.empty?
		puts "Empate!"
		gameOver
		break
	end
		
	unless gameOver
	# 	jogador escolhe campo
		puts player
		print "Escolha uma tentativa: "
			
		# verifica se escolheu um número de 1 a 9
		try = gets.chomp.to_i until tryLeft.include? try
		mGame.map! { |e|
			e == try ? e = player : e
		}
		tryLeft.delete(try)
		mPlayerGame[player] << try
	else
		puts "Fim de Jogo."
		break
	end
end
