# -*- coding: utf-8 -*-
# http://www.eonet.ne.jp/~tarcom/rubypage.html

@n = 100000
@i = 0

puts "Calculate PI to " + @n.to_s + " decimal places."

k, a, b, a1, b1 = 2, 4, 1, 12, 4

file = File.open('pi.txt','w')

while TRUE
  # Next approximation
  p, q, k = k*k, 2*k+1, k+1
  a, b, a1, b1 = a1, b1, p*a+q*a1, p*b+q*b1
  # Print common digits
  d = a / b
  d1 = a1 / b1
  while d == d1
    file.write d
    @i+=1
    if @i%(@n/10) == 0 then
      print "..." + (@i*100/@n).to_s + "%"
    end
    if @i > @n then
      puts "\ndone!"
      exit
    end
    # $stdout.flush
    a, a1 = 10*(a%b), 10*(a1%b1)
    d, d1 = a/b, a1/b1
  end
end

