class PackagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @packages = Package.all
  end

  def show
  end

  def daily_activity
    if params[:package].nil?
      render 'search'
    else
      @packages = Package.where(from_ip: from_ip)
      render 'show'
    end
  end

  def test
    last_two_weeks = []
    14.times {|x| last_two_weeks << [Time.now - x.day, 0] }
    @data = Package.where(from_ip: params[:from_ip]).pluck(:time)

    @data.each do |x|
      diff = (Time.now.to_date - x.to_date).to_i
      last_two_weeks[14 - diff][1] += 1
    end
    respond_to do |format|
      format.json { render :json => last_two_weeks }
    end
  end

  private

  def from_ip
    params[:package][:from_ip]
  end
end
