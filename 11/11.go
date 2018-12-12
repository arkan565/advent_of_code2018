package main

import (
	"fmt"
	"strconv"
)

func main() {
	var input = 7672
	var matrix [300][300]int
	var max = 0
	var maxi int
	var maxj int
	for i := 0; i < 300; i++ {
		for j := 0; j < 300; j++ {
			var rackID = i + 10
			var powerLevel = rackID * j
			powerLevel = powerLevel + input
			powerLevel = powerLevel * rackID
			var powerLevelString = strconv.Itoa(powerLevel)
			var char = string(powerLevelString[len(powerLevelString)-3])
			powerLevel, err := strconv.Atoi(char)
			if err == nil {
				powerLevel = powerLevel - 5
				matrix[i][j] = powerLevel
				if powerLevel < 0 {
					powerLevel = 0
				}
				if i >= 2 && j >= 2 {
					var auxValue = matrix[i][j] + matrix[i-1][j] + matrix[i-2][j]
					auxValue = auxValue + matrix[i][j-1] + matrix[i-1][j-1] + matrix[i-2][j-1]
					auxValue = auxValue + matrix[i][j-2] + matrix[i-1][j-2] + matrix[i-2][j-2]
					if auxValue > max {
						maxi = i - 2
						maxj = j - 2
						max = auxValue
					}
				}
			}
		}
	}
	fmt.Println(strconv.Itoa(maxi) + "," + strconv.Itoa(maxj))
	fmt.Println(max)
	max = 0
	var size = 0
	var l int
	var m int
	for i := 0; i < 300; i++ {
		for j := 0; j < 300; j++ {
			for k := 0; k+i < 300 && k+j < 300; k++ {
				var auxValue = 0
				for l = i; l < k+i; l++ {
					for m = j; m < k+j; m++ {
						auxValue = auxValue + matrix[l][m]
					}
				}
				if auxValue > max {
					max = auxValue
					maxi = i
					maxj = j
					size = k
				}
			}
		}
	}
	fmt.Println(strconv.Itoa(maxi) + "," + strconv.Itoa(maxj))
	fmt.Println(max)
	fmt.Println(size)
}
