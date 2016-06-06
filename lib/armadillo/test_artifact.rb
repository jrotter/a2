module Armadillo

  class TestArtifact


    attr_reader :status,
      :start_time,
      :stop_time,
      :success


    # Define an artifact
    #
    # *Options*
    #
    # none
    #
    # *Example*
    #
    #   Armadillo::TestArtifact.new()
    #
    def initialize
      @start_time = nil
      @stop_time = nil
      @status = "ready"
    end


    # Indicated that an artifact has been started
    #
    # *Options*
    #
    # none
    #
    # *Example*
    #
    #   a = Armadillo::TestArtifact.new()
    #   a.start()
    #
    def start
      @success = true #artifact is successful until it isn't
      @status = "running"
      @start_time = Time.now
  
      # I can define a pre- and post-execution method to be invoked by the parent via "super".  Look it up!
  
      # Or, more simply, I can invoke the pre- and post-execution methods via start and stop
    end


    # Indicated that an artifact has been stopped
    #
    # *Options*
    #
    # none
    #
    # *Example*
    #
    #   a = Armadillo::TestArtifact.new()
    #   a.start()
    #   a.stop()
    #
    def stop(success)
      @success = success
      if @success
        @status = "passed"
      else
        @status = "failed"
      end
      @stop_time = Time.now
    end


    # Determine whether an artifact has been started
    #
    # *Options*
    #
    # none
    #
    # *Example*
    #
    #   a = Armadillo::TestArtifact.new()
    #   a.start()
    #   a.started?
    #
    def started?
      @start_time
    end


    # Determine whether an artifact has completed
    #
    # *Options*
    #
    # none
    #
    # *Example*
    #
    #   a = Armadillo::TestArtifact.new()
    #   a.start()
    #   a.stop()
    #   a.completed?
    #
    def completed?
      @stop_time
    end


    # Determine whether an artifact has completed successfully
    #
    # *Options*
    #
    # none
    #
    # *Example*
    #
    #   a = Armadillo::TestArtifact.new()
    #   a.start()
    #   a.stop()
    #   a.completed_successfully?
    #
    def completed_successfully?
      @success and (@status == "passed")
    end


  end

end
