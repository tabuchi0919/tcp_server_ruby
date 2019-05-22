Process.daemon

require 'socket'
require 'timeout'

server = TCPServer.new('0.0.0.0', '23615')
loop do
  socket = server.accept
  flag = true
  Thread.start(socket) do |s|
    s.write "10^5<=x<=10^15\n"
    s.write "Time Limit: 2s\n"
    (1..10).each do |i|
      s.write "Q. #{i}/10\n"
      x = rand(10**(i + 4)..10**(i + 5))
      z = rand(10 * i..100 * i)
      y = x**z
      s.write "x^#{z}=#{y}\n"
      s.write "x=?\n"
      l = 0
      begin
        Timeout.timeout(2) { l = s.gets }
      rescue Timeout::Error
        s.write "Time's up\n"
        s.close
      end
      next unless l.to_i != x

      s.write "Wrong answer\n"
      flag = false
      break
    end
    s.write "Conguratulation!!!\n" if flag
    s.close
  end
end
