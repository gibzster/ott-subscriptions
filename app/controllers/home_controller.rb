class HomeController < ApplicationController

  def index
    if params[:query]
         @subscriptions = Subscription.joins(:customer).joins(:product).where('email LIKE ? OR name LIKE ? COLLATE utf8_general_ci', "%#{params[:query]}%","%#{params[:query]}%").order('subscriptions.subscribed_at DESC').page(params[:page])
    else
         @subscriptions = Subscription.order('subscriptions.subscribed_at DESC').page(params[:page])
    #     @subscription = Subscription.new
    end
  end
end

