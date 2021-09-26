# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

urls = %w[
  https://i.imgur.com/OuSizUw.jpeg
  https://i.imgur.com/GL7igry.jpeg
  https://i.imgur.com/NakfHv4.jpeg
  https://i.imgur.com/A755ZPz.jpeg
  https://i.imgur.com/f59T1nk.jpeg
  https://images.unsplash.com/photo-1544383835-bda2bc66a55d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3472&q=80
  https://images.unsplash.com/photo-1483736762161-1d107f3c78e1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2148&q=80
  https://images.unsplash.com/photo-1489875347897-49f64b51c1f8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2340&q=80
  https://images.unsplash.com/photo-1613068687893-5e85b4638b56?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2340&q=80
  https://i.imgur.com/oREP4uk.png
  https://i.imgur.com/KfutyIK.jpeg
  https://i.imgur.com/5yeBVeMb.jpg
  https://i.imgur.com/GL7igryb.jpg
  https://i.imgur.com/dCS4tQkb.jpg
  https://i.imgur.com/tCUq2GJb.jpg
  https://i.imgur.com/UieUlMQb.jpg
  https://i.imgur.com/5LHPAukb.jpg
  https://i.imgur.com/WOPSGj9b.jpg
  https://i.imgur.com/u1R691ib.jpg
  https://i.imgur.com/jZlovODb.jpg
  https://i.imgur.com/AaevbdOb.jpg
  https://i.imgur.com/BOBnmUHb.jpg
  https://i.imgur.com/sKV54POb.jpg
  https://i.imgur.com/3Zk4aNHb.jpg
  https://i.imgur.com/g6Y5cFtb.jpg
  https://i.imgur.com/A755ZPzb.jpg
  https://i.imgur.com/qlnIpwBb.jpg
  https://i.imgur.com/vxRZ5sxb.jpg
  https://i.imgur.com/xPdjbI2b.jpg
  https://i.imgur.com/7Jef2Jmb.jpg
  https://i.imgur.com/4KEurojb.jpg
  https://i.imgur.com/e1oLzc3b.jpg
  https://i.imgur.com/qP06YY4b.jpg
  https://i.imgur.com/Ywcvr7ub.jpg
  https://i.imgur.com/qvHHeXtb.jpg
  https://i.imgur.com/ea9PB3Hb.jpg
  https://i.imgur.com/nuANVcZb.jpg
  https://i.imgur.com/wP5ofkub.jpg
  https://i.imgur.com/77ofjEUb.jpg
  https://i.imgur.com/vd58PCXb.jpg
  https://i.imgur.com/RIhHH2fb.jpg
  https://i.imgur.com/iqAXRM3b.jpg
  https://i.imgur.com/sZoOKgvb.jpg
  https://i.imgur.com/yi2QaQcb.jpg
  https://i.imgur.com/v4Ahevrb.jpg
  https://i.imgur.com/TmnjoHxb.jpg
  https://i.imgur.com/ocPTVRYb.jpg
  https://i.imgur.com/Xuluboxb.jpg
  https://i.imgur.com/P9OOMAnb.jpg
  https://i.imgur.com/sRJa6nlb.jpg
  https://i.imgur.com/ESuXiFeb.jpg
  https://i.imgur.com/9od0mSob.jpg
  https://i.imgur.com/UthG27Rb.jpg
  https://i.imgur.com/YtkhlRjb.jpg
  https://i.imgur.com/dDfxzKab.jpg
  https://i.imgur.com/Iu8wmpOb.jpg
  https://i.imgur.com/WJ3vGdib.jpg
  https://i.imgur.com/MWTmcHrb.jpg
  https://i.imgur.com/Njys6p5b.jpg
  https://i.imgur.com/YGZc7F8b.jpg
  https://i.imgur.com/WZ9qZwHb.jpg
  https://i.imgur.com/041k8ctb.jpg
  https://i.imgur.com/2niEv0qb.jpg
  https://i.imgur.com/OuSizUwb.jpg
  https://i.imgur.com/6bhVxtqb.jpg
  https://i.imgur.com/LRGtU6Db.jpg
  https://i.imgur.com/BqHmYswb.jpg
  https://i.imgur.com/BblLC3lb.jpg
  https://i.imgur.com/ibfkDfBb.jpg
]

urls.each do |url|
  picture = Picture.find_or_create_by(image_url: url)
  picture.save
end

