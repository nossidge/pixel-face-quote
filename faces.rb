#!/usr/bin/env ruby
# encoding: UTF-8

################################################################################
# Make a random face out of random face images.
################################################################################

require_relative 'pixel-font/num_to_pic.rb'

################################################################################

module Faces

	def self.random_file(part_name)
		files = Dir["face_imgs/#{part_name}_*.png"]
		files.sample
	end

	def self.new(filename)
		base = ChunkyPNG::Image.from_file('face_imgs/base.png')
		body = ChunkyPNG::Image.from_file random_file('body')
		face = ChunkyPNG::Image.from_file random_file('face')
		eyes = ChunkyPNG::Image.from_file random_file('eyes')
		mout = ChunkyPNG::Image.from_file random_file('mouth')
		nose = ChunkyPNG::Image.from_file random_file('nose')
		hair = ChunkyPNG::Image.from_file random_file('hair')

		base.compose!(body, 0, 0)
		base.compose!(face, 0, 0)
		base.compose!(hair, 0, 0)
		base.compose!(eyes, 0, 0)
		base.compose!(mout, 0, 0)
		base.compose!(nose, 0, 0)
		base.compose!(hair, 0, 0)
		base.save(filename)
	end

end

################################################################################