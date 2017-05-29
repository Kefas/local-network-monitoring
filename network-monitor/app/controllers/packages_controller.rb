class PackagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @packages = Package.all
  end

  def show
  end

  def daily_activity
    if params[:package].nil?
      render 'daily_activity'
    else
      @packages = Package.where(from: from)
      render 'show'
    end
  end

  def name_activity
    if params[:package].nil?
      render 'name_activity'
    else
      compute_doughnut
      @data = @data.sort_by(&:count).take(5)
      render 'doughnut'
    end
  end

  def doughnut
    compute_doughnut
    respond_to do |format|
      format.json { render :json => @data.sort_by(&:count).take(5) }
    end
  end

  def compute_doughnut
    @packages = Package.where(from: from)
    uniq_domains = @packages.pluck(:to).uniq
    @data = []
    all_count = @packages.size
    uniq_domains.each do |domain|
      count = @packages.where(to: domain).size
      @data << OpenStruct.new(from: from, domain: domain, count: (count.to_f*100/all_count).ceil)
    end
  end

  def test
    last_two_weeks = []
    # 14.times {|x| last_two_weeks << [Time.now - x.day, 0] }
    last_two_weeks << [Time.now - 2.week, 0]

    (14*24*12).times { |x| last_two_weeks << [Time.now - (x*5).minutes, 0]}
    @data = Package.where(from: params[:from_ip]).pluck(:time)

    @data.each do |x|
      diff = ((Time.now - x.to_time)/60)/5.ceil
      last_two_weeks[last_two_weeks.size - diff][1] = 1
      # last_two_weeks << [x.to_date, 1]
    end
    respond_to do |format|
      format.json { render :json => last_two_weeks }
    end
  end

  private

  def from
    params[:package] && params[:package][:computer_name] || params[:from_ip]
  end
end
