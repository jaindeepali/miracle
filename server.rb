#server Miracle for Greeting the World!

require 'socket' 
#ruby socket library


puts "Starting up server..."


server = TCPServer.new('0.0.0.0',2000)
#server established for listening on port number 2000


while (session = server.accept)
#listening and accepting connection

   request = session.gets
   #reading request

   time=Time.new
   #current time

   puts request
   #showing request in terminal log

   headers = ["HTTP/1.1 200 OK",
             "Server: Miracle",
             "Content-Type: text/html; charset=iso-8859-1",
             "Date: "+ time.inspect+"\r\n\r\n"].join("\r\n")
   session.puts headers
   #putting appropriate headers

   filename = request.gsub(/GET\ \//, '').gsub(/\ HTTP.*/, '').chomp
   #extracting filename from request

   if filename == ""
      filename = "index.html"
   end
   #setting default filename

   begin
      showfile = File.open(filename, 'r')
      content = showfile.read()
      session.puts content
   rescue Errno::ENOENT
      session.puts "File not found"
   end
   #opening and displaying file

   session.close
   #closing session

end 
#end of loop