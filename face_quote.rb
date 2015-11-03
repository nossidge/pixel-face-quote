#!/usr/bin/env ruby
# encoding: UTF-8

################################################################################
# Random face with a quote.
################################################################################

require_relative 'faces.rb'
require_relative 'pixel-font/pixel_font.rb'

################################################################################

# Basic function to save to a png image.
def save_to_png(pixel_map, filename)
	pic = PicFromNumbers.new(pixel_map)
	pic.image_file = filename
	pic.colour_invert = true
	pic.pixel_size = 1
	pic.generate_image
end

################################################################################

# Simple handling of console input.
filename_out = ARGV[0] ? ARGV[0] : 'filename.png'
text = ARGV[1] ? ARGV[1] : 'Here is a witty quote.'
lines = ARGV[2] ? ARGV[2].to_i : 2

################################################################################

# File names.
filename_face   = 'new_face.png'
filename_speech = 'new_speech.png'

# Make a new face.
face_width  = 23
face_height = 23
Faces::new(filename_face)

# Make a new speech balloon.
font = PixelFont.new
font.text = text

# Needs to be "lines" lines in length.
# (Or one if there's only one word.)
pixels_per_line = 1
loop do
	font.to_paragraph(pixels_per_line)
	break if font.text.split("\n").length == lines 
	break if font.text.split(' ').length  == 1
	pixels_per_line += 1
end

# Save to png.
font.to_pixels
font.border(3,6)
font.speech('WS',5)
save_to_png(font.pixel_map,filename_speech)

# Load back as ChunkyPNG::Image object.
face   = ChunkyPNG::Image.from_file(filename_face)
speech = ChunkyPNG::Image.from_file(filename_speech)

# Prepare composited canvas.
x = font.map_width + face_width
y = [font.map_height, face_height].max
png = ChunkyPNG::Image.new(x, y, ChunkyPNG::Color::TRANSPARENT)

# Combine them.
png.compose!(face, 0, y-face_height)
png.compose!(speech, face_width, 0)
png.save(filename_out, :interlace => true)

# Kill temporary files.
File.delete(filename_face)
File.delete(filename_speech)

################################################################################
