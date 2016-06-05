require 'minitest/autorun'
require 'test_helper'

class ArtifactTest < Minitest::Test

  def setup
    # Any setup tasks should go here
  end


  ##################################################
  #
  # Testcase
  #
  ##################################################
  def test_artifact_check_application_generic_present
    t = Armadillo::Testcase.new()
  end

  ##################################################
  #
  # Testplan
  #
  ##################################################
  def test_artifact_check_application_generic_present
    t = Armadillo::Testplan.new()
  end

  ##################################################
  #
  # Script
  #
  ##################################################
  def test_artifact_check_application_generic_present
    s = Armadillo::Script.new()
  end

end

