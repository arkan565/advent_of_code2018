players=477;
maxn=7085100;
turn=0;
circle=[];
i=0;
position=2;
score=zeros(Int64,players);
push!(circle,0);
i=i+1;
turn=turn+1;
push!(circle,i);
i=i+1;
turn=turn+1;
splice!(circle,2,[2,1])
i=i+1;
position=2;
while i<=maxn
    global turn= turn+1;
    if (i%23)==0
        global position = position-7;
        if position<0
            global position= length(circle)+position;
        end
        if (turn%players) ==0
            global score[players]= score[players]+i+circle[position];
            splice!(circle,position);
        else
            global score[(turn%players)]= score[(turn%players)]+i+circle[position];
            splice!(circle,position)
        end
    else
        global position=position+2;
        if length(circle)+1<position
           position=position-length(circle);
        end
        if length(circle)+1==position
            push!(circle,i);
        else
            splice!(circle,position,[i,circle[position]]);
        end
    end
    global i=i+1;
end
max = 0;
for i in score
    if i>max
        global max = i;
    end
end
println(max);