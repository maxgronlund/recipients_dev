# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

organization_names = %w[Århus Randers]
family_names = ['Jette Hansen', 'Anders Petersen', 'Lene Damgaard', 'Ole Nielsen']

organization_names.each do |name|
  organization = Organization.where(name: name).first_or_create(name: name)
end

familes = []
family_names.first(2).each do |name|
  familes << Organization
    .first
    .families
    .where(name: name)
    .first_or_create(name: name)
end

family_names.last(2).each do |name|
  familes << Organization
    .last
    .families
    .where(name: name)
    .first_or_create(name: name)
end

Family.find_each do |family|
  User.where(
    name: family.name,
    family_id: family.id
  ).first_or_create(
    name: family.name,
    family_id: family.id
  )
end


user_names = ['Peter Hansen', 'Mie Petersen', 'Jens Damgaard', 'Nana Nielsen']
Family.all.each_with_index do |family, index|
  User.where(
    name: user_names[index],
    family_id: family.id
  ).first_or_create(
    name:  user_names[index],
    family_id: family.id
  )
end