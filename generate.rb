#!/usr/bin/env ruby

require "csv"
require "cgi"

data_file = "vendorpol.csv"

vendor_data = Hash.new { |h, k| h[k] = {} } # A hash of hashes

CSV.foreach(data_file, headers: true, header_converters: :symbol) do |row|
  vendor_data[row[:vendor]][row[:title]] = {
    account: row[:account],
    privacy_url: row[:privacy_url],
    tc_url: row[:tc_url]
  }
end

puts <<HEAD
  <p>
    Explanatory text goes here.
  </p>
HEAD

vendor_data.sort_by { |v| v[0] }.each do |vendor|
  puts "<h3> " + CGI.escapeHTML(vendor[0]) + "</h3>"
  puts "  <ul>"
  vendor[1].sort_by { |p| p[0] }.each do |product|
    print "    <li> " + CGI.escapeHTML(product[0]) + ": "
    unless product[1][:privacy_url].nil?
      print %(<a href="#{product[1][:privacy_url]}">privacy</a>)
      print ", " unless product[1][:tc_url].nil?
    end
    unless product[1][:tc_url].nil?
      print %(<a href="#{product[1][:tc_url]}">t&amp;c</a>)
    end
    if product[1][:account] == "optional"
      print " (account optional)"
    elsif product[1][:account] == "mandatory"
      print " (account mandatory)"
    end
    puts "</li>"
  end
  puts "  </ul>"
end
