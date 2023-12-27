#!/usr/bin/env ruby

require "date"
require 'optparse'
opt = OptionParser.new

params = {}
opt.on('-m VAL') {|v| params[:m] = v }         
opt.on('-y VAL') {|v| params[:y] = v }          

opt.parse!(ARGV)

if params[:m]
  month = params[:m].to_i
else
  month = Date.today.month
end

if params[:y]
  year = params[:y].to_i
else
  year = Date.today.year
end

month_first_day = Date.new(year,month,1).wday
month_last_day = Date.new(year,month,-1).day

puts "#{month}月 #{year}".center(20)
puts "日 月 火 水 木 金 土"
print "   " * month_first_day
week = month_first_day

(1..month_last_day).each do |n|
  print n.to_s.rjust(2) + " "
  week = week + 1
  if week%7 == 0
    print "\n"
  end
end


