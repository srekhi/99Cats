# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all

cat1 = Cat.create(birth_date: "2015/01/20", color: "black", name: "Ranelle", sex: "F", description: "Ranelle is a cat")
cat2 = Cat.create(birth_date: "2013/04/22", color: "white", name: "Christine", sex: "F", description: "Christine is a cat")
cat3 = Cat.create(birth_date: "2014/08/13", color: "brown", name: "Brandon", sex: "M", description: "Loves sushi")

CatRentalRequest.destroy_all

rental1 = CatRentalRequest.create(cat_id: cat1.id, start_date: "2017/04/20", end_date: "2017/06/20", status: "APPROVED")
rental2 = CatRentalRequest.create(cat_id: cat1.id, start_date: "2017/02/20", end_date: "2017/04/18")
rental3 = CatRentalRequest.create(cat_id: cat1.id, start_date: "2017/03/14", end_date: "2017/05/30")
rental4 = CatRentalRequest.create(cat_id: cat1.id, start_date: "2017/06/15", end_date: "2017/07/28")
rental5 = CatRentalRequest.create(cat_id: cat2.id, start_date: "2017/04/20", end_date: "2017/06/20")
