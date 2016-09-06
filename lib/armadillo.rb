require 'armadillo/artifact'
require 'armadillo/script'
require 'armadillo/testplan'
require 'armadillo/testcase'

# [cat]  something
# something else
#
#
# * Top level comment about Armadillo

module Armadillo

  # Global hash containing each Parfait::Page object indexed by page name (and alias)
  PAGES = Hash.new


  # Do something in Armadillo
  #
  # *Options*
  #
  # +&block+:: specifies the code block to be called whenever Armadillo needs to do something.  Takes a hash as a parameter.
  #
  # *Example*
  #
  #   Armadillo.do_something { |opts|
  #     MyLogger::write(string,opts)
  #   }
  #
  def Armadillo.do_something(&block)
    Thread.current[:armadillo_something] = block
  end 

 
end
