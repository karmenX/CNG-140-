#include <stdio.h>
#include <stdlib.h>


#define SIZE 30

struct Movies {
    char name[SIZE];
    int ranking;
};

void addMovie(struct Movies **array, int *initial_number, int *number_of_movies);
void findBest(struct Movies *array, int number_of_movies);
void storeMovie(struct Movies *list, int number_of_movies);

int main() {
    int initial_number = 10;
    int number_of_movies = 0;
    struct Movies *data = (struct Movies *) malloc(sizeof(struct Movies) * initial_number);
    if (data == NULL) {
        printf("Memory allocation failed!\n");
        exit(1);
    }

    int choice;

    do {
        // Print the menu
        printf("1) Add movie\n"
               "2) Find best movie\n"
               "3) Store movies\n");

        printf("What would you like to do? ");

        // Read choice and handle input properly
        scanf("%d", &choice); // Note the space before %c to skip whitespace

        switch (choice) {
            case 1:
                addMovie(&data, &initial_number, &number_of_movies);
                break;
            case 2:
                findBest(data, number_of_movies);
                break;
            case 3:
                storeMovie(data, number_of_movies);
                break;
            case 4:
                exit(1);
            default:
                printf("Please enter a number between 1 and 3.\n");
                break; // Continue loop if invalid input
        }
    } while (choice!=4); // Loop until valid input is provided

    // Free allocated memory
    free(data);

    return 0;
}

void addMovie(struct Movies **array, int *initial_number, int *number_of_movies) {
    if (*number_of_movies >= *initial_number) {
        int new_size = *initial_number * 2; // Double the size
        struct Movies *temp = (struct Movies *) realloc(*array, sizeof(struct Movies) * new_size);

        if (temp == NULL) {
            printf("Memory reallocation failed.\n");
            exit(1);
        }
        *array = temp;
        *initial_number = new_size;
    }

    printf("Enter the name of the movie: ");
    scanf(" %[^\n]", (*array)[*number_of_movies].name); // Read movie name including spaces
    printf("Enter ranking: ");
    scanf("%d", &(*array)[*number_of_movies].ranking);
    printf("%s is added.\n", (*array)[*number_of_movies].name);
    (*number_of_movies)++;
}

void findBest(struct Movies *array, int number_of_movies) {
    if (number_of_movies == 0) {
        printf("No movies available.\n");
        return;
    }

    int best_index = 0;
    for (int i = 1; i < number_of_movies; i++) {
        if (array[i].ranking > array[best_index].ranking) {
            best_index = i;
        }
    }

    printf("The best movie is \"%s\" with ranking %d.\n", array[best_index].name, array[best_index].ranking);
}

void storeMovie(struct Movies *list, int number_of_movies) {
    FILE *stream = fopen("movie.txt", "w");
    if (stream == NULL) {
        printf("Failed to open file.\n");
        exit(1);
    }

    for (int i = 0; i < number_of_movies; i++) {
        fprintf(stream, "%s %d\n", list[i].name, list[i].ranking);
    }

    fclose(stream);
    printf("movie.txt is successfully created!\n");
}
