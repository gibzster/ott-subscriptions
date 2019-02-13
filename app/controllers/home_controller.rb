class HomeController < ApplicationController

  def index
    @subscriptions = Subscription.order('subscriptions.subscribed_at DESC').page(params[:page])
  end
end
