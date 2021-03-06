# 简易 Todo 代办事项应用

text = File.read("todos.txt")

todos = []
text.each_line do |line|
  todos << line.chomp
end

todos.each_with_index do |todo, index|
  puts "#{index}: #{todo}"
end

while (true)
  print "请输入指令 1. add 2. remove 3. save，然后按 Enter: "
  command = gets.chomp

  if command == "add"
    print "请输入代办事项: "
    todos << gets
  elsif command == "remove"
    print "请输入要删除的编号: "
    num = gets.to_i
    todos.delete_at(num)
  elsif command == "save"
    puts "存盘离开"

    File.open("todos.txt","w+") do |f|
      todos.each do |i|
        f << i
        f << "\n"
      end
    end
    #这样写入的时候，之前todos.rb中的内容会不会抹掉呢？

    todos.each_with_index do |todo, index|
      puts "#{index}: #{todo}"
    end

    break;
  else
    puts "看不懂，请再输入一次"
  end
end
