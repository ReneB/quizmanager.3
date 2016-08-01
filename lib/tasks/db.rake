namespace :db do
  desc "Reload all fixtures into the database and perform some post-processing on them"
  task reload: 'db:fixtures:load' do
    ContentImage.find_each do |image|
      ContentImage.reset_counters(image.id, :answers, :questions)
    end

    Learnable.find_each do |learnable|
      Learnable.reset_counters(learnable.id, :questions)
    end
  end
end
