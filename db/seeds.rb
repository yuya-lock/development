# このコードは、db/seeds/development ディレクトリの下に「ディレクトリ名.rb」があれば、それを require メソッドで実行するもの。本番モードでは db/seeds/production ディレクトリの下のファイルを実行する。

table_names = %w(users)
table_names.each do |table_names|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end