puts "Clearing old data..."
Category.destroy_all
Avatar.destroy_all

puts "Seeding Categories..."


agility=Category.create(name:"Agility")
strength=Category.create(name:"Strength")
intelligence=Category.create(name:"Intelligence")


puts "Seeding Avatars..."

Avatar.create(name:"Bloodseeker",category_id:agility.id)
Avatar.create(name:"Axe",category_id:strength.id)
Avatar.create(name:"Lina",category_id:intelligence.id)
Avatar.create(name:"Maiden",category_id:intelligence.id)





puts "Done!"