# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first

User.create(name: 'Admin', email: 'admin@example.com', password: '123456', password_confirmation: '123456', admin: true)

10.times do
	u = User.new
	u.name = Faker::Name.name
	u.email = Faker::Internet.email
	u.password = '123456'
	u.password_confirmation = '123456'
	u.admin = 'false'
	u.save
end

users = User.all

def copy_image_fixture(file_name, id)
  dir = Rails.root.join('public', 'system', 'photos', 'images', '000', '000')
  Dir.mkdir(dir) unless File.directory?(dir)
  FileUtils.cp(file_name, dir.join(id.to_s))
end

fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')

10.times do 
	photo = Photo.create!(
	    caption: Faker::Lorem.sentence(1),
	    user_id: users.id.sample,
	    image: File.new(fixtures_path.join( rand('photographer.jpg', 'lady_bird.jpg', 'sunrise.jpg', 'waterfall.jpg'))

end

10.times do
	uc = Ucomment.new
	uc.body = Faker::Lorem.sentence(1)
	uc.photo_id = rand(1..10)
	uc.user_id = rand(1..11)
	uc.score = rand(1..5)
	uc.save
end
