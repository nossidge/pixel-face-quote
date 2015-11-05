#!/usr/bin/env ruby
# encoding: UTF-8

################################################################################
# Make a random face out of random face images.
################################################################################

require_relative 'pixel-font/num_to_pic.rb'

################################################################################

module Faces

	PATH = "#{File.dirname(__FILE__)}/face_imgs/"

	def self.random_file(part_name, rand_seed=nil)
		files = Dir["#{PATH}#{part_name}_*.png"]
		srand(rand_seed.to_s.sum) if rand_seed
		files.sample
	end

	def self.new(filename, zoom=1, rand_seed=nil)
		base = ChunkyPNG::Image.from_file PATH + 'base.png'
		body = ChunkyPNG::Image.from_file random_file('body',rand_seed)
		face = ChunkyPNG::Image.from_file random_file('face',rand_seed)
		eyes = ChunkyPNG::Image.from_file random_file('eyes',rand_seed)
		mout = ChunkyPNG::Image.from_file random_file('mouth',rand_seed)
		nose = ChunkyPNG::Image.from_file random_file('nose',rand_seed)
		hair = ChunkyPNG::Image.from_file random_file('hair',rand_seed)

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
