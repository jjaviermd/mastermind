require "./colors_module"

class PcPlayer

  include ColorsTools

  attr_reader :secret_code

  def initialize
    @secret_code = nil
  end

  def set_secret_code
    @secret_code = ColorsTools.random_color
  end
end
