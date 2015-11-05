#!/usr/bin/env ruby
# encoding: UTF-8

################################################################################
# Make a random face out of random face images.
################################################################################

require_relative 'pixel-font/num_to_pic.rb'

################################################################################

module Faces

	PATH = "#{File.dirname(__FILE__)}/face_imgs/"

	def self.random_file(part_name)
		files = Dir["#{PATH}#{part_name}_*.png"]
		files.sample
	end

	def self.new(filename, zoom=1)
		base = ChunkyPNG::Image.from_file PATH + 'base.png'
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
		
		# Zoom if necessary.
		if zoom != 1
			base.resample_nearest_neighbor!(base.width * zoom, base.height * zoom)
		end
		
		base.save(filename)
	end

end

################################################################################
