require 'minitest/autorun'
require 'armadillo'


class ArtifactTest < Minitest::Test

  def setup
    # Any setup tasks should go here
  end


  ##################################################
  #
  # Artifact
  #
  ##################################################
  def test_artifact_full_test_success
    a = Armadillo::TestArtifact.new()
    assert !a.started? 
    assert !a.completed?
    assert !a.completed_successfully?
    assert a.status == "ready"
    assert a.start_time == nil
    assert a.stop_time == nil

    a.start
    assert a.started?
    assert !a.completed?
    assert !a.completed_successfully?
    assert a.status == "running"
    assert a.start_time != nil
    assert a.start_time.is_a? Time
    assert a.stop_time == nil

    a.stop(true)
    assert a.started?
    assert a.completed?
    assert a.completed_successfully?
    assert a.status == "passed"
    assert a.start_time != nil
    assert a.start_time.is_a? Time
    assert a.stop_time != nil
    assert a.stop_time.is_a? Time
  end

  def test_artifact_full_test_failure
    a = Armadillo::TestArtifact.new()
    assert !a.started? 
    assert !a.completed?
    assert !a.completed_successfully?
    assert a.status == "ready"
    assert a.start_time == nil
    assert a.stop_time == nil

    a.start
    assert a.started?
    assert !a.completed?
    assert !a.completed_successfully?
    assert a.status == "running"
    assert a.start_time != nil
    assert a.start_time.is_a? Time
    assert a.stop_time == nil

    a.stop(false)
    assert a.started?
    assert a.completed?
    assert !a.completed_successfully?
    assert a.status == "failed"
    assert a.start_time != nil
    assert a.start_time.is_a? Time
    assert a.stop_time != nil
    assert a.stop_time.is_a? Time
  end

  def test_artifact_pre_routine_success
    @testval = "hello"
    a = Armadillo::TestArtifact.new()
    a.set_pre_routine { @testval = "goodbye" }
    assert @testval == "hello"
    a.start

    assert @testval == "goodbye"
    @testval = "helloagain"

    a.stop(true)
    assert @testval == "helloagain"
  end

  def test_artifact_pre_routine_failure
    @testval = "hello"
    a = Armadillo::TestArtifact.new()
    a.set_pre_routine { @testval = "goodbye" }
    assert @testval == "hello"

    a.start
    assert @testval == "goodbye"
    @testval = "helloagain"

    a.stop(false)
    assert @testval == "helloagain"
  end

  def test_artifact_pre_routine_success
    @testval = "hello"
    a = Armadillo::TestArtifact.new()
    a.set_post_routine { @testval = "goodbye" }
    assert @testval == "hello"
    a.start

    assert @testval == "hello"

    a.stop(true)
    assert @testval == "goodbye"
  end

  def test_artifact_pre_routine_failure
    @testval = "hello"
    a = Armadillo::TestArtifact.new()
    a.set_post_routine { @testval = "goodbye" }
    assert @testval == "hello"

    a.start
    assert @testval == "hello"

    a.stop(false)
    assert @testval == "goodbye"
  end

end

