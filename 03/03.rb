line_num=1
squares = Array.new
text=File.open('input').read
text.gsub!(/\r\n?/, "\n")
maxX=0
maxY=0
text.each_line do |line|
  list1 = line.split("@")
  list2 = list1[1].split(":")
  list3 = list2[0].split(",")
  list4 = list2[1].split("x")
  list3[0]=list3[0].strip
  list3[1]=list3[1].strip
  list4[0]=list4[0].strip
  list4[1]=list4[1].strip

  if maxX < list3[0].to_i+list4[0].to_i
    maxX = list3[0].to_i+list4[0].to_i
  end
  if maxY < list3[1].to_i+list4[1].to_i
    maxY = list3[1].to_i+list4[1].to_i
  end
  squares.push("#{list3[0]},#{list3[1]},#{list4[0]},#{list4[1]}")
end
result = Array.new(maxY){Array.new(maxX){0}}
index=0
squares.each do |numbers|
  
  list = numbers.split(",")
  y=list[1].to_i
  while y <list[1].to_i + list[3].to_i
    aux = result[y]
    auxCounter=0
    x=list[0].to_i
    while x <list[0].to_i + list[2].to_i
      if aux[x] ==0
        aux[x]=index+1
      else
        aux[x]=-1
      end
      x=x+1
    end
    y=y+1
  end
  index=index+1
end
index=0
squares.each do |numbers|
  list = numbers.split(",")
  y=list[1].to_i
  while y <list[1].to_i + list[3].to_i
    aux = result[y]
    auxCounter=0
    x=list[0].to_i
    while x <list[0].to_i + list[2].to_i
      if aux[x] ==-1
        break
      end
      auxCounter=auxCounter+1
      x=x+1
    end
    if x !=list[0].to_i + list[2].to_i
      break
    end
    y=y+1
  end
  if y == list[1].to_i + list[3].to_i
    puts(index+1)
  end
  index=index+1
end
counter = 0
result.each do |array|
  array.each do |number|
    if number==-1
      counter=counter+1
    end
  end
end
puts(counter)