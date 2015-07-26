namespace :db do
  desc "Populate the database using FactoryGirl"
  task prepopulate: :environment do
    FactoryGirl.create_list(:section, 3)
    FactoryGirl.create_list(:reference, 3)
  end

end
