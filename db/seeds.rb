10.times do |i|
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'TestApp123')
end

user = User.find_by_email('ramyani77@gmail.com') || User.create!(first_name: 'Ramyani', last_name: 'Ghosh', email: 'ramyani77@gmail.com', password: 'TestApp123')

long_lats = [[9836624.352507748, 2580413.017850318], [8932311.49669763, 1453297.4880438568], [8637791.360307746, 1456487.824104421]]

long_lats.each do |longitude, latitude|
  user.user_locations.create(is_public: true, latitude: latitude, longitude: longitude)
end

long_lats = [[8524423.590883877, 3999058.4460615315], [7925101.716351051, 2542613.7291362695], [9825358.820039468, 3127970.1937846714]]
User.where('id <> ?', user.id).limit(3).each_with_index do |sender, index|
  loc = sender.user_locations.create(is_public: false, latitude: long_lats[index][1], longitude: long_lats[index][0])
  user.shared_locations.create(user_location_id: loc.id)

  public_long_lats = [[9836624.352507748, 2580413.017850318], [8932311.49669763, 1453297.4880438568], [8637791.360307746, 1456487.824104421]]
  public_long_lats.each do |longitude, latitude|
    sender.user_locations.create(is_public: true, latitude: latitude, longitude: longitude)
  end
end
