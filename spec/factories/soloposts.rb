FactoryBot.define do
  factory :solopost do
      nickname                { 'タロウ' }
      introduction            { '自己紹介文' }
      genre_id                { 3 }
      musical_instrument_id   { 2 }
      area_id                 { 2 }

      after(:build) do |solopost|
        solopost.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        solopost.video.attach(io: File.open('public/images/test_video.mp4'), filename: 'test_video.mp4')
      end
  
      association :user
  
  end
end
