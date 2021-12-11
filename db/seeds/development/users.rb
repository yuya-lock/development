fnames = [ "佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
10.times(i) do |i|
  User.create(
    name: "#{fnames[i % 4]} #{gnames[i % 3]}",
    mail: "#{names[i]}@example.com",
    password: "example"
  )
end