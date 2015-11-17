class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def create
    # you should see this in the sidekiq console under scheduled
    GenerateQuotesJob.set(wait: 5.minute).perform_later

    redirect_to :back, success: 'The quotes were generated successfully.'
  end
end
