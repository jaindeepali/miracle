require 'socket'
puts "Starting up server..."
server = TCPServer.new('0.0.0.0',2008)
while (session = server.accept)
   request = session.gets
   session.puts "\n\n\n                         HELLO WORLD!!\n\n\n"
   session.close
end 
