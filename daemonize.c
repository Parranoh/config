#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "Usage: %s COMMAND ARG...", argv[0]);
        return EXIT_FAILURE;
    }
    int success = daemon(1, 0);
    if (success != 0)
    {
        perror("daemon");
        return EXIT_FAILURE;
    }
    execvp(argv[1], argv + 1);
    return EXIT_FAILURE;
}
