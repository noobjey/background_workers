class GenerateBooksJob < ActiveJob::Base
  queue_as :default

  after_perform do
    puts "JOB FINISHED: #{Time.now}"
  end

  before_enqueue do
    puts "JOB STARTED: #{Time.now}"
  end

  def perform(*args)
    Book.generate
  end
end
