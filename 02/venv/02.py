
count2 = 0
count3 = 0
characters = ""
with open('input', 'rU') as f:
  for line in f:
      aux2=False
      aux3=False
      for c in line:
          if line.count(c)==2 and aux2==False :
              aux2 = True
              count2 = count2+1

          if line.count(c)==3 and aux3==False :
              aux3 = True
              count3 = count3+1

          if aux2 and aux3:
              break

with open('input', 'rU') as f:
    for line in f:
        with open('input2', 'rU') as f2:
            for line2 in f2:
                differences = 0
                if line != line2:
                  for i in range(0,len(line2)):
                      if line[i] != line2[i]:
                          differences=differences+1

                if differences ==1 :
                    for i in range(0, len(line2)):
                        if line[i] == line2[i]:
                            characters= characters+line[i]


result = count2*count3
print(result)
print(characters)
