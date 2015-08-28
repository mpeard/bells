class Erin
  
  def initialize(touch = '')
    @path = ['4675312']
    @touch = ''
    
    touch.chars.each do |c|
      c == '1' ? bob : plain
    end
  end
  
  def plain
    @path << [ 1, 2, 3, 4, 5, 6, 0 ].map{ |x| @path.last.chars[x] }.join
    @touch << '0'
  end
  
  def bob
    @path << [ 3, 1, 2, 4, 5, 6, 0 ].map{ |x| @path.last.chars[x] }.join
    @touch << '1'
  end
  
  def rounds?
    @path.first[0,4] == @path.last[0,4]
  end
  
  def true?
    test_truth
    @true
  end
  
  def length
    l = (@path.length-1) * 6
    if rounds? 
      l = l - 4 if @path.last[4,3] == "123"
      l = l - 2 if @path.last[4,3] == "231"
    end
    l
  end
  
  def touch
    @touch
  end
  
  def path
    @path
  end
  
  def depth
    @touch.length
  end
  
  def test_truth
    @true = true
    @sixes = {}
    
    @path.each do |s|
      @true = false if @sixes[s[0,4]]
      @sixes[s[0,4]] = true
    end
  end
  
  def write(filename)
    File.open(filename, 'w') do |f|
      @path.each_with_index do |p, t|
        six_end = "#{[5, 6, 4, 0, 3, 1, 2].map {|i| p.chars[i] }.join}#{@touch[t] == '1' ? ' -' : ''}"
        six_end = "(#{six_end})" if rounds? and p == @path.last and p != "4675312"
        f.puts six_end
      end
    end
  end
  
end

