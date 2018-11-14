# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Turn.destroy_all
Challenge.destroy_all
Player.destroy_all


Player.create(name: "megan")
Player.create(name: "barbara")
Player.create(name: "bilikis")

Challenge.create(video_url: 'https://www.youtube.com/embed/gwWRjvwlLKg', drinks: 1, title: 'Macarena', description: "You all should know this one. Do the Macarena. Worth 1 drink.")
Challenge.create(video_url: 'https://www.youtube.com/embed/wZv62ShoStY', drinks: 1, title: 'Cha Cha Slide', description: "Time to get funky with the Cha Cha Slide. Listen to Mr. C! Worth 1 drink.")
Challenge.create(video_url: 'https://www.youtube.com/embed/Ct6BUPvE2sM', drinks: 3, title: 'Pen Pineapple Apple Pen (PPAP)', description: "If you don\'t konw this one, SHAAAAAAAME! Time to learn. Worth 3 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/5jBkoEM0SSE', drinks: 3, title: 'Electric Slide', description: "The Electric Side, y\'all. Have fun! Worth 3 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/vjW8wmF5VWc', drinks: 2, title: 'Watch Me (Whip/Nae Nae)', description: "We want to see you whip and nae nae. Worth 2 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/fE_64SdD27w', drinks: 3, title: 'Wobble', description: "Wobble baby. Worth 3 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/9bZkp7q19f0', drinks: 2, title: 'Gangnam Style', description: "Don\'t act like you dont know this. Worth 2 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/h24_zoqu4_Q', drinks: 2, title: 'Cupid Shuffle', description: "Show us your Cupid Shuffle. Worth 2 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/LfNHGifUvSQ', drinks: 3, title: 'Keke', description: "Not as popular, but a goodie. We'll love you even if you can\'t do it. Worth 3 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/l5sIspLfmXM', drinks: 1, title: 'Chicken Dance.', description: "Nuff said. Worth 1 drink.")
Challenge.create(video_url: 'https://www.youtube.com/embed/4V90AmXnguw', drinks: 3, title: 'Thriller', description: "Oh boy oh boy oh boy. Thrill us. Worth 3 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/umj0gu5nEGs', drinks: 3, title: 'Time Warp', description: "You\'re just some sweet transvestites for this one. Do the Time Warp! Worth 3 drinks.")
Challenge.create(video_url: 'https://www.youtube.com/embed/Vc0gYbTNctU', drinks: 1, title: 'Y.M.C.A.', description: "Alright, boys and girls. Worth 1 drink.")


Challenge.create(video_url: 'https://www.youtube.com/embed/uS8fYjT9bfc', drinks: 3, title: 'Dança da maozinha', description: "A delightful Brazilian classic. Worth 3 drinks (if you survive).")
Challenge.create(video_url: 'https://www.youtube.com/embed/iTtmlGEXzY8', drinks: 4, title: 'Vai Malandra', description: "A Brazilian modern hit with a funky twist. Extra points for freestyling. Worth 4 drinks, you better do your best.")
Challenge.create(video_url: 'https://www.youtube.com/embed/eh4QQJyl-qA', drinks: 2, title: 'Bum bum tam tam', description: "Titillate us with your bum bum tam tam. Worth 2 drinks.")
