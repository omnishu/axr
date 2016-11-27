namespace :rank_collector do
  desc 'It collects rank of websited given'
  task update_rank: :environment do
    User.find_each do |user|
      UpdateRanksJob.perform_async(user)
    end
  end
end
