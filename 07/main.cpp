#include <cstdlib>
#include <iostream>
#include <iostream>
#include <fstream>
#include <string>
#include <string.h>
using namespace std;
struct Letter{
	char character;
	char next[27];
	char before[27];
	bool visited;
};

int main(int argc, char *argv[])
{
	int auxi,i,j,k,l,auxi2,cycle;
	Letter letters[27];
	int count=0;
	string line;
	bool found1;
	bool found2;
    ifstream myfile;
  	myfile.open("input");
  	getline(myfile,line);
  	char result[27];
  	while(!myfile.eof())
  	{
		found1=false;
		found2=false;
		for(i=0;i<count;i++){
			if(letters[i].character==line[36]){
				letters[i].before[strlen(letters[i].before)+1]='\0';
				letters[i].before[strlen(letters[i].before)]=line[5];
				found1=true;
			}
			if(letters[i].character==line[5]){
				letters[i].next[strlen(letters[i].next)+1]='\0';
				letters[i].next[strlen(letters[i].next)]=line[36];
				found2=true;
			}
		}
		if(!found1){
			letters[count].character=line[36];
			letters[count].before[0]=line[5];
			letters[count].before[1]='\0';
			letters[count].next[0]='\0';
			letters[count].visited=false;
			count++;
		}
		if(!found2){
			letters[count].character=line[5];
			letters[count].next[0]=line[36];
			letters[count].next[1]='\0';
			letters[count].before[0]='\0';
			letters[count].visited=false;
			count++;
		}
		getline(myfile, line);	
	}
	for(l=0;l<count;l++){
		auxi=-1;
		cout<<letters[l].character<<endl<<letters[l].before<<endl;
		for(i=0;i<count;i++){			
			if(letters[i].visited==false){
				for(j=0;j<strlen(letters[i].before);j++){
					for(k =0;k<count;k++){
						if(letters[k].character==letters[i].before[j])
						{
							if(!letters[k].visited){
								break;
							}
						}
					}
					if(k<count){
						break;
					}
				}
				if(j==strlen(letters[i].before)){
					if(auxi==-1||letters[i].character<letters[auxi].character){
						auxi=i;
					}
				}
			}		
		}
		letters[auxi].visited=true;
		//cout<<letters[auxi].character;
	}
	for(i=0;i<count;i++){
		letters[i].visited=false;
	}
	cout<<endl;
	while(l<count){
		for(i=0;i<count;i++){			
			if(letters[i].visited==false){
				for(j=0;j<strlen(letters[i].before);j++){
					for(k =0;k<count;k++){
						if(letters[k].character==letters[i].before[j])
						{
							if(!letters[k].visited){
								break;
							}
						}
					}
					if(k<count){
						break;
					}
				}
				if(j==strlen(letters[i].before)){
					l++;
				}
				
			}		
		}
	}
    cin >>line;
    return EXIT_SUCCESS;
}
