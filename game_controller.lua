--[[

Rock Paper Scissors Lizard Spock
LuaController for Minetest

Copyright (c) 2014 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-rpsls-lc
License: BSD-3-Clause

]]--


-- change of human/cpu (via mesecon player detector)
if (event.type=='on' or event.type=='off') then
  if (mem.player2) then
    mem.human_tmp = event.type
  else
    mem.human = event.type
    if (mem.human=='off') then
      digiline_send('vs_display', 'VS CPU')
    else
      digiline_send('vs_display', 'VS Human')
    end
  end
end

-- digiline signals
if (event.type=='digiline') then

  -- reset
  if (event.channel=='reset') then
    digiline_send('player1_display', '')
    digiline_send('player2_display', '')
    digiline_send('score_display', '')
    mem.player1 = nil
    mem.player2 = nil
    mem.score_player1 = 0
    mem.score_player2 = 0
    mem.score_draw = 0
    if (mem.human_tmp) then
      mem.human = mem.human_tmp
      mem.human_tmp = nil
      if (mem.human=='off') then
        digiline_send('vs_display', 'VS CPU')
      else
        digiline_send('vs_display', 'VS Human')
      end
    end
  end

  -- player1 choice
  if (event.channel=='player1' and not mem.player1) then
    mem.player1 = event.msg
    if (not mem.player2) then
      digiline_send('player1_display', 'Selected '..event.msg..'. Waiting on Player2...')
    end
  end
  
  -- player2 choice
  if (event.channel=='player2' and not mem.player2) then
    mem.player2 = event.msg
    mem.human = 'on'
    if (not mem.player1) then
      digiline_send('player2_display', 'Selected '..event.msg..'. Waiting on Player1...')
    end
  end
  
  -- cpu choice
  if (mem.human=='off' and mem.player1 and not mem.player2) then
    options = {'rock','paper','scissors','lizard','spock'}
    mem.player2 = options[math.random(5)]
  end
  
  -- handle winner
  if (mem.player1 and mem.player2) then
  
    -- find the winner and message
    winner = 'draw'
    message = 'That\'s a draw!'
    if (mem.player1=='rock') then
      if (mem.player2=='scissors') then
        winner = 'player1'
        message = 'rock smashes scissors'
      elseif (mem.player2=='lizard') then
        winner = 'player1'
        message = 'rock crushes lizard'
      end
      if (mem.player2=='paper') then
        winner = 'player2'
        message = 'paper covers rock'
      elseif (mem.player2=='spock') then
        winner = 'player2'
        message = 'spock vaporizes rock'
      end
    elseif (mem.player1=='paper') then
      if (mem.player2=='rock' ) then
        winner = 'player1'
        message = 'paper covers rock'
      elseif (mem.player2=='spock') then
        winner = 'player1'
        message = 'paper disproves spock'
      end
      if (mem.player2=='lizard') then
        winner = 'player2'
        message = 'lizard eats paper'
      elseif (mem.player2=='scissors') then
        winner = 'player2'
        message = 'scissors cuts paper'
      end
    elseif (mem.player1=='scissors') then
      if (mem.player2=='paper') then
        winner = 'player1'
        message = 'scissors cuts paper'
      elseif (mem.player2=='lizard') then
        winner = 'player1'
        message = 'scissors decapitates lizard'
      end
      if (mem.player2=='rock') then
        winner = 'player2'
        message = 'rock crushes scissors'
      elseif (mem.player2=='spock') then
        winner = 'player2'
        message = 'spock smashes scissors'
      end
    elseif (mem.player1=='lizard') then
      if (mem.player2=='paper' ) then
        winner = 'player1'
        message = 'lizard eats paper'
      elseif (mem.player2=='spock') then
        winner = 'player1'
        message = 'lizard poisons spock'
      end
      if (mem.player2=='rock') then
        winner = 'player2'
        message = 'rock crushes lizard'
      elseif (mem.player2=='scissors') then
        winner = 'player2'
        message = 'scissors decapitates lizard'
      end
    elseif (mem.player1=='spock') then
      if (mem.player2=='scissors') then
        winner = 'player1'
        message = 'spock smashes scissors'
      elseif (mem.player2=='rock') then
        winner = 'player1'
        message = 'spock vaporizes rock'
      end
      if (mem.player2=='lizard') then
        winner = 'player2'
        message = 'lizard poisons spock'
      elseif (mem.player2=='paper') then
        winner = 'player2'
        message = 'paper disproves spock'
      end
    end

    -- display and reset results
    if (winner=='draw') then
      message = mem.player1 .. ' and ' .. mem.player2 .. '? '..message
    else
      message = message .. ' - ' .. winner .. ' wins!'
    end
    digiline_send('player1_display', message)
    digiline_send('player2_display', message)
    mem.player1 = nil
    mem.player2 = nil
    
    -- increment and display scores
    mem['score_'..winner] = mem['score_'..winner] + 1
    digiline_send('score_display', 'Player1 '..mem.score_player1..' Player2 '..mem.score_player2..' Draw '..mem.score_draw)

    -- handle change of human/cpu during game
    if (mem.human_tmp) then
      mem.human = mem.human_tmp
      mem.human_tmp = nil
      if (mem.human=='off') then
        digiline_send('vs_display', 'VS CPU')
      else
        digiline_send('vs_display', 'VS Human')
      end
    end
    
  end

end