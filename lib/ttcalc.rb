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

  def count(countfield)
    valhash = Hash.new
    @input.each do |i|
      if i[countfield].is_a? Array
        i[countfield].each do |j|
          if valhash[j]
            valhash[j] = valhash[j] + 1
          else
            valhash[j] = 1
          end
        end
      else
        if valhash[i[countfield]]
          valhash[i[countfield]] += 1
        else
          valhash[i[countfield]] = 1
        end
      end
    end

    outarray = Array.new
    valhash.each do |k,v|
      temphash = Hash.new
      temphash[countfield] = k
      temphash["count"] = v
      outarray.push(temphash)
    end

    return JSON.pretty_generate(outarray)
  end
end
