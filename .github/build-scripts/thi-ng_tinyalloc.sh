#!/usr/bin/env bash


# Name of the C file
file_name="main.c"

# Create and write the C program to the file
cat << EOF > $file_name
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tinyalloc.h" // Assuming the API is defined in this header

int main() {
    // Define the heap and control structure for tinyalloc
    char heap[1024]; // Example heap size
    char control[1024]; // Control structure size

    // Initialize the tinyalloc with control structure and heap parameters
    ta_init(control, heap, 256, 16, 8);

    // Allocate memory using tinyalloc
    void *ptr = ta_alloc(100);
    if (ptr == NULL) {
        fprintf(stderr, "Allocation failed\n");
        return EXIT_FAILURE;
    }

    // Use the allocated memory
    strcpy(ptr, "Hello, tinyalloc!");
    printf("%s\n", (char *)ptr);

    // Check if heap structure is ok
    if (!ta_check()) {
        fprintf(stderr, "Heap structure corrupted\n");
        return EXIT_FAILURE;
    }

    // Free the allocated memory
    if (!ta_free(ptr)) {
        fprintf(stderr, "Freeing memory failed\n");
        return EXIT_FAILURE;
    }

    // Check again after freeing
    if (!ta_check()) {
        fprintf(stderr, "Heap structure corrupted after freeing\n");
        return EXIT_FAILURE;
    }

    printf("Memory was allocated and freed successfully.\n");

    return EXIT_SUCCESS;
}
EOF

gcc -o tinyalloc_example tinyalloc.c main.c 

