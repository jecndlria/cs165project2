#include <stdio.h>
#include <string.h>
#include <sys/stat.h> 
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>

char filename[100];

// strings - get your group's strings from the TA
#define STRING1 "test_this_offset_impact_longer_longer"
#define STRING2 ""


		

void test(char* input)
{
    volatile char buf[] = STRING1;
    volatile char buf2[] = STRING2;
    char test[17] = "abc";
    strcpy(test, input);
    
    printf("You have input: %s\n", test);
}

void log_result()
{
    int fd = creat(filename, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    close(fd);
}


void log_result_advanced(int print)
{
    if(print == 0xefbeadde)
    {
        char filename2[100];
        int uid = getuid();
        // the file needs to be generated at a location where normal users cannot touch
        sprintf(filename2, "uid_%d_crack_advanced", uid);
        printf("file name: %s\n", filename2);
        int fd = creat(filename2, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
        close(fd);
    }
}

void main(int argc, char** args)
{
    if(argc > 1)
    {
        int uid = getuid();
        // the file needs to be generated at a location where normal users cannot touch
        sprintf(filename, "uid_%d_crack", uid);
        printf("file name: %s\n", filename);
        test(args[1]);
    }
    else
    {
        printf("Please provide at least one input\n");
    }

    exit(0);
}


void function_pointer_function(void (*fptr)())
{
	printf("In function_pointer_function: %s", STRING1);
	fptr();
}

void shell_function()
{
	printf("In shell_function: %s", STRING2);
	system("/bin/ls -la");
}

