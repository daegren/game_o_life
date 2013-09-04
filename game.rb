#!/usr/bin/env ruby

require './cell.rb'
require './board.rb'

class Game
  def initialize
    puts 'Game starting'
    load_seeds
    start_game
  end

  def load_seeds
    @board = Board.new
    #load seeds from seed.txt
    seeds = nil
    File.open("seed.txt", "r") do |file|
      seeds = file.readlines
    end

    line = 0
    seeds.each do |seed|
      seed = seed.chomp
      seed_array = seed.split('');
      cell = 0
      seed_array.each do |c|
        @board.set_cell line, cell, Cell.new(c)
        cell += 1
      end
      line += 1
    end

    @generation = 0
  end

  def run_generation
    @board.draw_board
    @generation += 1
  end

  def generation
    @generation
  end

  def start_game
    puts "Running simulation for generation #{generation}"
    run_generation
  end
end

Game.new