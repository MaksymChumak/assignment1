--[[
    Pause State
    Author: MaksymChumak
    https://github.com/MaksymChumak

    Pauses the game. 
]]

PauseState = Class{__includes = BaseState}


function PauseState:init()
    self.pauseIcon = PauseIcon()
    self.state = 'pause'
end

function PauseState:enter(params)
    self.score = params.score
    self.timer = params.timer 
    self.bird = params.bird
    self.pipePairs = params.pipePairs

    sounds['play_music']:pause()
    sounds['pause_music']:setLooping(true)
    sounds['pause_music']:play()
end

function PauseState:exit()
    sounds['play_music']:play()
    sounds['pause_music']:pause()
end

function PauseState:render()
    for k, pair in pairs(self.pipePairs) do
      pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

    self.bird:render()
    self.pauseIcon:render()
end

function PauseState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('play', {
      score = self.score,
      bird = self.bird,
      pipePairs = self.pipePairs,
      timer = self.timer,
      previousState = self.state
    })
  end
    
end


