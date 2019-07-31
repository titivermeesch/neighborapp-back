20.times do
    Request.create(
        user_id: Faker::Alphanumeric.alphanumeric,
        title: Faker::Lorem.word,
        request_type: 'normal',
        description: Faker::Lorem.sentence(15),
        date: 1,
        required_people: 10,
        x: 41,
        y: 50,
        status: 'open'
    )
end