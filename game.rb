#!/usr/bin/env ruby

class Game
  def initialize
    puts 'Game starting'
    load_seeds
    start_game
  end

  def load_seeds
    #load seeds from seed.txt

    @generation = 0
  end

  def run_generation

    @generation += 1
  end

  def generation
    @generation
  end

  def start_game
    while true
      run_generation
      puts "Running simulation for generation #{generation}"
    end
  end
end

Game.new