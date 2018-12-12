// Learn more about F# at http://fsharp.org

open System
open System.IO
type Data() =
    member x.Read() =
        // Read in a file with StreamReader.
        use stream = new StreamReader @"D:\documentos\programacion\adventofcode2018\05\input.txt"
        // Continue reading while valid lines.
        let mutable valid = true
        while (valid) do
            let mutable line = stream.ReadLine()
            let mutable i=0
            let mutable find=0
            let mutable line2 = line
            if(line<>null)then
                while(i>=0) do
                    i <- 0
                    find <-0
                    while(i<line.Length) do
                        if (i<>line.Length-1) then
                            if(System.Char.ToUpper(line.[i])=line.[i]) then
                                if(System.Char.ToLower(line.[i])=line.[i+1]) then
                                    line <- line.Remove(i,2)
                                    find<-1
                            elif(System.Char.ToLower(line.[i])=line.[i]) then
                                if(System.Char.ToUpper(line.[i])=line.[i+1]) then
                                    line <- line.Remove(i,2)
                                    find<-1
                        i<-i+1
                    if(find = 0) then
                        i <- -1     
                printfn "%d" line.Length
                let mutable j=0
                let mutable lineaux=line2
                let mutable min = line2.Length
                let mutable minj = 0
                let letters="abcdefghijklmnopqrstuvwxyz"
                while(j<26) do
                    lineaux<-line2
                    i <- 0
                    while(i<lineaux.Length) do
                        if(System.Char.ToLower(lineaux.[i]) =letters.[j] || System.Char.ToUpper(lineaux.[i])=letters.[j]) then
                            lineaux<- lineaux.Remove(i,1)
                            i<-0
                        else
                            i<-i+1
                    i <- 0
                    while(i>=0) do
                        i <- 0
                        find <-0
                        while(i<lineaux.Length) do
                            if (i<lineaux.Length-1) then
                                if(System.Char.ToUpper(lineaux.[i])=lineaux.[i]) then
                                    if(System.Char.ToLower(lineaux.[i])=lineaux.[i+1]) then
                                        lineaux <- lineaux.Remove(i,2)
                                        find<-1
                                elif(System.Char.ToLower(lineaux.[i])=lineaux.[i]) then
                                    if(System.Char.ToUpper(lineaux.[i])=lineaux.[i+1]) then
                                        lineaux <- lineaux.Remove(i,2)
                                        find<-1
                                    
                            i<-i+1
                        if(find = 0) then
                            i <- -1     
                    if(lineaux.Length<min)then
                        min<-lineaux.Length
                        minj<-j
                    j<-j+1
                printfn "%d" min
            else 
                valid<-false
               
[<EntryPoint>]
let main argv =
    let data = Data()
    data.Read()
    System.Console.ReadLine()
    0 // return an integer exit code
