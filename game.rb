#!/usr/bin/env ruby

require './cell.rb'

class Game
  def initialize
    puts 'Game starting'
    load_seeds
    start_game
  end

  def load_seeds
    @board = []
    #load seeds from seed.txt
    seeds = nil
    File.open("seed.txt", "r") do |file|
      seeds = file.readlines
    end

    line = 0
    seeds.each do |seed|
      @board[line] = []
      seed = seed.chomp
      seed_array = seed.split('');
      cell = 0
      seed_array.each do |c|
        @board[line][cell] = Cell.new(c)
        cell += 1
      end
      line += 1
    end

    @generation = 0
  end

  def run_generation

    @generation += 1
  end

  def generation
    @generation
  end

  def start_game
    # while true
    #   run_generation
    #   puts "Running simulation for generation #{generation}"
    # end
  end
end

Game.new