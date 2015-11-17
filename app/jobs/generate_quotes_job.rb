class GenerateQuotesJob < ActiveJob::Base
  queue_as :default

  def perform(*args)

    Quote.generate
  end
end
