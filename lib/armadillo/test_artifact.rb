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
      @pre_routine = nil
      @post_routine = nil
      @log = nil
      @html_log = nil
    end


    # Define a routine to run before this artifact runs
    #
    # *Options*
    #
    # +block+:: specifies the block of code to run before the artifact runs
    #
    # *Example*
    #
    #   a = Armadillo::TestArtifact.new()
    #   a.set_pre_routine {
    #     puts "Artifact is about to run"
    #   }
    #
    def set_pre_routine(&block)
      @pre_routine = block
    end


    # Define a routine to run after this artifact completes
    #
    # *Options*
    #
    # +block+:: specifies the block of code to run after the artifact completes
    #
    # *Example*
    #
    #   a = Armadillo::TestArtifact.new()
    #   a.set_post_routine {
    #     puts "Artifact is done running"
    #   }
    #
    def set_post_routine(&block)
      @post_routine = block
    end


    # Indicated that an artifact has been started and run the pre-routine if applicable
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
      @pre_routine.call if @pre_routine
    end


    # Indicate that an artifact has been stopped and run the post-routine if applicable
    #
    # *Options*
    #
    # +success+:: specifies whether the application completed succesfully (true) or not (false)
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
      @post_routine.call if @post_routine
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
