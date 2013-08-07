# -*- coding: utf-8 -*-
require 'rubygems'
require 'cairo'

# constants
Surface_Width    = 1920
Surface_Height   = 1080
Font_Size        = 12
Font_Name        = "Mairyo"
Input_File_Name  = "pi.txt"
Output_File_Name = "pi.png"

Font_Width       = 5
Font_Height      = 10

# canvas
format = Cairo::FORMAT_ARGB32
surface = Cairo::ImageSurface.new(format, Surface_Width, Surface_Height)
context = Cairo::Context.new(surface)

# background
pattern2 = Cairo::LinearPattern.new(Surface_Width*0.0, Surface_Height*0.4,
                                    Surface_Width*0.0, Surface_Height*1.0)
pattern2.add_color_stop(0.0, :AQUA)
pattern2.add_color_stop(1.0, :COBALT)
context.set_source(pattern2)
context.rectangle(0, 0, Surface_Width, Surface_Height)
context.fill

# font
context.set_source_rgb(0, 0, 0)
context.select_font_face(Font_Name)
context.set_font_size(Font_Size)

# font color
pattern = Cairo::LinearPattern.new(Surface_Width*0.0, Surface_Height*0.0,
                                   Surface_Width*0.0, Surface_Height*1.0)
pattern.add_color_stop(0.0, :GRAY)
pattern.add_color_stop(1.0, :BLACK)
context.set_source(pattern)

# open file
file = open(Input_File_Name)

print "Drowing" + Input_File_Name + "..."

# draw
offset_x = 0
offset_y = 0
y = offset_y + Font_Height
# C-like code?
while y - Font_Height < Surface_Height
  x = offset_x
  while x + Font_Width < Surface_Width
    while !((c = file.getc) =~ /[0-9.]/)
    end
    #puts x.to_s + "," + y.to_s
    context.move_to(x,y)
    context.show_text(c)
    #print c
    x += Font_Width
    #STDIN.gets
  end
  y += Font_Height
end

# output
surface.write_to_png(Output_File_Name)

puts "\ndone!"
