# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog_post do
    user_id 1
    title "MyString"
    text "MyText"
  end
end
