#include<stdio.h>
#include<string.h>
#include<stdlib.h>

char str[100], left[15], right[15];

struct exp
{
    int pos;
    char op;
} k[15];

void findopr();
void explore();
void fleft(int);
void fright(int);

int main()
{
    printf("\t\tINTERMEDIATE CODE GENERATION\n\n");
    printf("Enter the Expression: ");
    scanf("%s", str);
    printf("The intermediate code:\n");
    findopr();
    explore();
    return 0;
}

void findopr()
{
    int j = 0;
    char operators[] = {'+', '-', '*', '/', '='};

    for (int i = 0; str[i] != '\0'; i++)
    {
        for (int opIndex = 0; opIndex < sizeof(operators) / sizeof(operators[0]); opIndex++)
        {
            if (str[i] == operators[opIndex])
            {
                k[j].pos = i;
                k[j++].op = operators[opIndex];
                break;
            }
        }
    }
}

void explore()
{
    int i = 0;
    while (k[i].op != '\0')
    {
        fleft(k[i].pos);
        fright(k[i].pos);
        str[k[i].pos] = 'Z' - i; // Use a constant character instead of tmpch
        printf("\t%c := %s%c%s\t\t", str[k[i].pos], left, k[i].op, right);
        printf("\n");
        i++;
    }

    fright(-1);

    if (i == 0)
    {
        fleft(strlen(str));
        printf("\t%s := %s", right, left);
    }
    else
    {
        printf("\t%s := %c", right, str[k[i - 1].pos]);
    }
}

void fleft(int x)
{
    int w = 0, flag = 0;
    x--;

    while (x != -1 && str[x] != '+' && str[x] != '*' && str[x] != '=' && str[x] != '\0' && str[x] != '-' && str[x] != '/' && str[x] != ':')
    {
        if (str[x] != '$' && flag == 0)
        {
            left[w++] = str[x];
            left[w] = '\0';
            str[x] = '$';
            flag = 1;
        }
        x--;
    }
}

void fright(int x)
{
    int w = 0, flag = 0;
    x++;

    while (x != -1 && str[x] != '+' && str[x] != '*' && str[x] != '\0' && str[x] != '=' && str[x] != ':' && str[x] != '-' && str[x] != '/')
    {
        if (str[x] != '$' && flag == 0)
        {
            right[w++] = str[x];
            right[w] = '\0';
            str[x] = '$';
            flag = 1;
        }
        x++;
    }
}
