#include<stdio.h>
#include<stdlib.h>


int isWhiteSpace(char ch)
{
    if (ch == ' ' || ch == '\n' || ch == '\t' || ch=='\0')
    {
        return 1;
    }
    return 0;
}
int main()
{
    FILE *input;
    FILE *output;
    input = fopen("input.dat", "r");
    output = fopen("output.dat", "w");
    if (input == NULL || output == NULL)
    {
        printf("Error in file operation..\n");
        exit(0);
    }
    char ch;
    while((ch=fgetc(input))!=EOF){
        if(isWhiteSpace(ch)==0){
            fprintf(output,"%c",ch);
        }
    }
    fclose(input);
    fclose(output);
}
