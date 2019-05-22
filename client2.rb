require 'socket'

def solve(y, z)
  d = Math.log(z) / y
  factrial = (1..200).inject([1]) do |arr, i|
    arr.push(arr.last * i)
  end
  200.times.inject(0) do |sum, i|
    sum += d**i * 1.0 / factrial[i]
  end.round
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
