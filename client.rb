require 'socket'

def solve(y, z)
  ng = 0
  ok = 100_000_000_000_000_000_000
  while ok - ng > 1
    mid = (ok + ng) / 2
    if mid**y >= z
      ok = mid
    else
      ng = mid
    end
  end
  ok
end

def main
  sockin = TCPSocket.open('13.114.188.239', '23615')
  sockout = sockin

  puts response = sockin.gets
  puts response = sockin.gets

  10.times do
    puts response = sockin.gets
    puts response = sockin.gets
    x, y, z = response.gsub('^', '=').split('=')
    puts response = sockin.gets
    y = y.to_i
    z = z.to_i
    ans = solve(y, z)
    puts ans
    sockout.write("#{ans}\n")
  end

  loop do
    puts response = sockin.gets
    break if response.nil?
  end
end

main if $PROGRAM_NAME == __FILE__
