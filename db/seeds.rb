# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Product.delete_all

Product.create(:title => 'Programando Rails',
  :description => %{<p>PEPE POMPIN<br>Esta es una prueba de poblacion de datos automatica},
  :img_url => '/img/ruby.jpg', :precio => 25.28
  )

Product.create(:title => 'asdas Rails',
  :description => %{<p>PEPE asdasdasdasd<br>Esta es una prueba de poblacion de datos automatica},
  :img_url => '/img/ruby2.jpg', :precio => 25.28
  )

Product.create(:title => 'asdas sadasd',
  :description => %{<p>PEsdasdaPE asdasdasdasd<br>Esta esasdasdasduna prueba de poblacion de datos automatica},
  :img_url => '/img/ruby3.jpg', :precio => 25.28
  )
