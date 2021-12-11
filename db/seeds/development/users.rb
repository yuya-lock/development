fnames = [ "佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
fnames_mail = [ "sato", "suzuki", "takahashi", "tanaka"]
gnames_mail = [ "taro", "ziro", "hanako"]
10.times do |i|
  User.create(
    name: "#{fnames[i % 4]} #{gnames[i % 3]}",
    mail: "#{fnames_mail[i % 4]}#{gnames_mail[i % 3]}}@example.com",
    password: "example"
  )
end