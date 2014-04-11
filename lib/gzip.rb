require 'zlib'
require 'stringio'

class String

  def gzip
    if self.length > 0 then
      zdata = ""
      sio = StringIO.new(zdata)
      gz = Zlib::GzipWriter.new(sio)
      
      gz.write(self)
      gz.close
      
      zdata
    else
      ""
    end

  end

  def gunzip
    if self.length > 0 then
      sio = StringIO.new(self)
      gz = Zlib::GzipReader.new(sio)

      string = gz.read
      gz.close

      string
    else
      ""
    end
  end

end

