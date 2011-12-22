# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
#
    employees = Employee.create([
                                { first_name: 'Jonathan', last_name: 'Wallace' }, 
                                { first_name: 'Casey', last_name: 'Douce' },
                                { first_name: 'John', last_name: 'Jarrett' },
                                { first_name: 'Kip', last_name: 'Walker' }
                               ])

   roles = Role.create([
                                { name: 'Operations Manager' }, 
                                { name: 'Supervisor' }, 
                                { name: 'Vendor' }, 
                                { name: 'Cashier' }
                               ])

  roles = Shift.create([
                                { name: 'Batman morning' }, 
                                { name: 'Batman afternoon' }, 
                                { name: 'Country Cousins morning' }, 
                                { name: 'Country Cousins afternoon' }
                               ])



