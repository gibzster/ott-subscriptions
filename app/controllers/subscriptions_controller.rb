class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_subscription, only: [:show, :update, :destroy]
  def index
    @subscriptions = Subscription.all
    render json: @subscriptions, include: {customer: {except: %i[created_at updated_at]}, product: {except: %i[created_at updated_at]}}, except: %i[created_at updated_at customer_id product_id]
  end

  def show
    render json: @subscription
  end

  def create
    @product = Product.find_by(name: params['product_name'])
    @product = Product.create(name: params['product_name']) if @product.nil?

    @customer = Customer.find_by(email: params['email'])
    if @customer.nil?
      @customer = Customer.create(email: params['email'], city: params['city'],
                                  state: params['state'], country: params['country'])
    end
    @subscription = Subscription.create(billing_type: params['billing_type'],
                                        platform: params['platform'],
                                        subscribed_at: params['subscribed_at'])
    @subscription.customer = @customer
    @subscription.product = @product

    if @subscription.save
      render json: @subscription, status: :created, location: subscription_url(@subscription)
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  def update
    if params.has_key?(:product_name)
      @product = Product.find_by(name: params['product_name'])
      @product = Product.create(name: params['product_name']) if @product.nil?
      @subscription.product << @product
    end
    if params.has_key?(:email)
      @customer = Customer.find_by(email: params['email'])
      @customer.create(email: params['email'], city: params['city'],
                      state: params['state'], country: params['country'])
      @subscription.email << @customer
    end
    if @subscription.save
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription.destroy
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:billing_type, :subscribed_at, :platform)
  end
end