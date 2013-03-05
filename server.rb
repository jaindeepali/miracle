#!/usr/bin/ruby
require 'socket'
puts "Starting up server..."
# establish the server
## Server established to listen for connections on port 2008
server = TCPServer.new('localhost',2008)
# setup to listen and accept connections
while (session = server.accept)
   request = session.gets
   #trimmedrequest = request.gsub(/GET\ \//, '').gsub(/\ HTTP.*/, '')
   #filename = trimmedrequest.chomp
   #  filename = "index.html"
   #end
   session.puts request
   session.puts "Server: Welcome #{session.peeraddr[2]}\n"
  # begin
   #  content = displayfile.read()
    #  session.print content
   #rescue Errno::ENOENT
    #  session.print "File not found"
   #end
   session.close
end   #end loop
