FactoryBot.define do
    factory :task do
      users { build_list :user, 1 }
      title { 'title' }
      description { 'description' }
      status { 'recently_added' } 
    end
end
