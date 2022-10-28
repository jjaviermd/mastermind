require 'io/console'
##
# This module provides tools to geneate a combination of up to 4 colors.

module ColorsTools
  # Valid colors are yellow, green, blue, prurple and orange
  COLORS = %w[yellow green blue purple red orange].freeze
  # #manual_combination: Allows to select a combinantion of four intergers
  # from 1 to 6. eache one representing a color.
  # returns an array of those intergers
  def self.manual_combination
    puts "\nPick four colors\n
          1 -yellow
          2 -green
          3 -blue
          4 -purple
          5 -red
          6 -orange\n"
    num_code = STDIN.noecho(&:gets).chomp.split('').map { |n| n.to_i - 1 }
  end

  # #valid_nums?: Takes an array as arguments. returns true if the array's
  # contents are four intergers from 1 to 6 each. returns false otherwise.
  def self.valid_nums?(code)
    return true if code.length == 4 && code.all? { |n| n.between?(0, 5) }

    false
  end

  # #error: prints message on screen : "Code non valid!. Please select four numbers between 1 and 6."
  def self.error
    puts 'Code non valid!. Please select four numbers between 1 and 6.'
  end

  # #to_colors: Takes a valid array as the only argument. Returns a new array
  # of colors
  def self.to_colors(code)
    code.map { |n| COLORS[n] }
  end

  # #random_color: returns a new array of four colors. Uses #sample.
  def self.random_color
    Array.new(4) { COLORS.sample }
  end
end
