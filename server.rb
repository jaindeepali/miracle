require 'socket'
puts "Starting up server..."
server = TCPServer.new('0.0.0.0',2008)
while (session = server.accept)
   request = session.gets
   response = "<h1>HELLO WORLD!!</h1>"
   time=Time.new
   puts request
   headers = ["HTTP/1.1 200 OK",
             "Server: Ruby",
             "Content-Type: text/html; charset=iso-8859-1",
             "Content-Length: response.length",
             "Date: "+time.inspect+"\r\n\r\n"].join("\r\n")
   session.puts headers  
   session.puts response
   session.close
end 
