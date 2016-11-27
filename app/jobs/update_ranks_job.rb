require 'open-uri'
class UpdateRanksJob < ApplicationJob
  include SuckerPunch::Job
  workers 2

  queue_as :default

  DEFAULT_URL = 'http://alexa.com/siteinfo/'

  def perform(user)
    sites = user.sites
    sites.each do |site|
      update_rank(site)
    end
  end

  private

  def update_rank(site)
    site_url = URI.parse(site.url)
    site_url.hostname
    parsable_url = DEFAULT_URL + site_url.hostname
    doc = Nokogiri::HTML(open(parsable_url))
    rank = doc.css('#traffic-rank-content .rank-row strong.metrics-data.align-vmiddle')
    rank = rank.text.strip!
    rank = rank.gsub(',', '').to_f
    site.analytics[Time.now.to_i] = rank
    site.save
  end
end
