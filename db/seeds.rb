emails = ['user1@cool.com', 'user2@cool.com']
emails.each_with_index do |email, ix|
  user = User.create(email: email, password: '123456789')
  site = Site.create(url: "http://#{ix}test.com", analytics: {(Time.now - 1.day).to_i => 123 + ix, (Time.now - 2.days).to_i => 124 + ix})
  user.sites << site
end

User.create!(email: 'admin@admin.com', password: 'admin@12345', admin: true)