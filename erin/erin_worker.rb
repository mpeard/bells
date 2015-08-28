require 'sidekiq'
require 'tempfile'
require './erin'

class ErinWorker
  include Sidekiq::Worker
  
  def perform(touch)
    e = Erin.new(touch)
    fname = "results-peter/#{e.length.to_s.rjust(4, "0")}-#{Time.now.strftime('%Y%m%d%H%M%S%L')}-#{[*'a'..'z', *'A'..'Z'].to_a.shuffle[0,4].join}"
    
    if e.true? and e.depth < 16
      ErinWorker.perform_async(touch + "0") #plain
      ErinWorker.perform_async(touch + "1") #bob
    elsif e.rounds?
      e.write(fname + "-rounds")
    end
  end
end
