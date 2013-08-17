require 'date'

module FakerHelper

  def self.title type = nil
    type = type.nil? ? "" : " (#{type})"
    Faker::Lorem.words(2).map{ |w| w.capitalize }.join(' ') + type
  end

  def self.description type = nil
    type = type.nil? ? "" : " (#{type})"
    Faker::Lorem.paragraph + type
  end

  def self.datetime
    DateTime.now
  end

  def self.close_datetime hard_offset = 0, range_in_days = 120
    offset = (hard_offset + rand(range_in_days)) * 60 * 60 * 24
    str = "#{Time.at(Time::now.to_i + offset).to_i}"
    DateTime.strptime(str,'%s')
  end

  def self.full_address
    "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state}, USA"
  end

  def self.room
    "Room #{1+rand(20)}"
  end

  def self.sample_assignment_category
    ['Quiz', 'Homework', 'Exam', 'Reading', 'Video'].sample
  end
end

FactoryGirl.define do
  
  factory :assignment do
    name { FakerHelper.title }
    description { Faker::Lorem.paragraph }
    category { FakerHelper.sample_assignment_category }
    due { FakerHelper.datetime }
    late { (due.to_time + 60*60*24).to_datetime }
  end

  factory :calendar_event do
    name { FakerHelper.titile }
    start { FakerHelper.datetime }
    finish { FakerHelper.datetime }
  end

  factory :comment do
    contents { Faker::Lorem.paragraph }
  end

  factory :course do
    name { FakerHelper.title }
  end

  factory :school do
    location { FakerHelper.full_address }
    name { FakerHelper.title }
  end

  factory :section do
    name { FakerHelper.title }
    capacity { 20 + rand(10) }
    description { FakerHelper.description }
    start { FakerHelper.datetime }
    finish { FakerHelper.datetime }
    location { FakerHelper.room}
  end

  factory :submission do
    note { Faker::Lorem.sentence }
    submitted { FakerHelper.datetime }
  end

  factory :user do
    first { Faker::Name.first_name }
    last { Faker::Name.last_name }
    email { "#{first}.#{last}@#{Faker::Internet.domain_name}".downcase }
    password "abcd1234"
    password_confirmation "abcd1234"

    factory :super do
      first "Super"
      last  "User"
      email "your_email@test.com"
      after(:build){ |a| a.add_role :super }
    end

    factory :admin do
      after(:build){ |a| a.add_role :admin }
    end

    factory :teacher do
      after(:build){ |t| t.add_role :teacher }
    end

    factory :student do
      after(:build){ |s| s.add_role :student }
    end
  end
end