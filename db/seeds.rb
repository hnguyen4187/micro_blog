test_users = [
    ["first", "last", "pass"],
    ["firstname", "lastname", "password"]
]

test_users.each do |fn, ln, pw|
    User.create(fname: fn, lname: ln, password: pw)
end

test_posts = [
  ['title1', 'content1', 1],
  ['title1', 'content1', 2],
  ['title2', 'content2', 1],
  ['title2', 'content2', 2],
]

test_posts.each do |title, content, author|
  Post.create(title:title, content:content, user_id:author)
end
