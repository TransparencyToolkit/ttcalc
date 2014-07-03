require 'json'

class TTCalc
  def initialize(input)
    @input = JSON.parse(input)
  end

  def summatching(attsum, attmatch)
    @attsum = attsum
    @attmatch = attmatch

    attvals = Hash.new
    @input.each do |i|
      if attvals[i[@attmatch]]
        attvals[i[@attmatch]] = attvals[i[@attmatch]]+i[@attsum]
      else
        attvals[i[@attmatch]] = i[@attsum]
      end
    end
    
    outarray = Array.new
    attvals.each do |k,v|
      temphash = Hash.new
      temphash[@attmatch] = k
      temphash[@attsum] = v
      outarray.push(temphash)
    end

    return JSON.pretty_generate(outarray)
  end
end

