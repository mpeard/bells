class Path
  def initialize(p = [[ 4, 6, 7, 5, 3, 1, 2 ]])
    @path = p
    test_truth
  end
  
  def plain
    Path.new(@path.clone << @path.last.rotate)
  end
  
  def bob
    Path.new(@path.clone << [ 3, 1, 2, 4, 5, 6, 0 ].map{ |x| @path.last[x] } )
  end
  
  def rounds?
    @path.first.first(4) == @path.last.first(4)
  end
  
  def true?
    @true
  end
  
  def length
    (@path.length-1) * 6
  end
  
  def path
    @path
  end
  
  def test_truth
    @true = true
    @sixes = {}
    
    @path.each do |s|
      @true = false if @sixes[s.first(4).join]
      @sixes[s.first(4).join] = true
    end
  end
  
  def self.read(filename)
    path = []
    sixes = []
    
    File.open(filename, 'r').each do |l|
      path << l.chars.map{ |x| x.to_i }
    end
    
    Path.new path
  end
  
  def write(filename)
    File.open(filename, 'w') do |f|
      @path.each do |p|
        f.puts p.join
      end
    end
  end
  
end
