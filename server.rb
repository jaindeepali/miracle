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
             #{}"Content-Length: #{response.length}",
             "Date: "+ time.inspect+"\r\n\r\n"].join("\r\n")
   session.puts headers
   trimmedrequest = request.gsub(/GET\ \//, '').gsub(/\ HTTP.*/, '')
   filename = trimmedrequest.chomp
   if filename == ""
      filename = "index.html"
   end
   begin
      displayfile = File.open(filename, 'r')
      content = displayfile.read()
      session.puts content
   rescue Errno::ENOENT
      session.puts "File not found"
   end
   session.close
end 
