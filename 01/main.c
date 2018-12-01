#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
  	char userInput[1000];
	char *token;
	long int result = 0;
	int auxresult=0;
	int problem=1;
	int counter = 0;
	int *resultList;
	int i,j;
	while(1){
		printf("*:>>");
		userInput[0]='\0';
		gets(userInput);
		if(strcmp(userInput,"exit")==0){
			break;
		}else if(strcmp(userInput,"result1")==0){
			printf("result is :%d",result);
		}else if(strcmp(userInput,"result2")==0){
			while(1){			
				for(i=0;i<counter;i++){
					if(i==0){
						result = result+resultList[0];
					}else{
						result = result-resultList[i-1]+resultList[i];
					}
					for(j=0;j<counter;j++){
						if(resultList[j]==result)
							break;
					}
					
					if(j<counter)
						break;
					counter++;
					if(counter==1){
						resultList = malloc(1*sizeof(int));
					}else{
						resultList = realloc(resultList, counter*sizeof(int));
					}
					resultList[counter-1]=result;
				}
				if(i<counter){
					break;
				}
			}
			printf("first duplicate input = %d",result);
		}else{
			for(token = strtok(userInput, ","); token != NULL; token = strtok(NULL, ",")){
		    	result = result+atoi(token);
				counter++;
				if(counter==1){
					resultList = malloc(1*sizeof(int));
				}else{
					resultList = realloc(resultList, counter*sizeof(int));
				}
				resultList[counter-1]=result;
			}
		}
	}	
  	return 0;

}
