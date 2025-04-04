#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define SIZE 100

int main() {
    char *data[] = {
            "B. Caldwall 555-98-4182 7.32 37",
            "D. Memcheck 555-53-2147 8.32 40",
            "R. Potter 555-32-9826 6.54 40",
            "W. Rosen 555-09-4263 9.80 35"
    };

    FILE *file = fopen("payroll.txt", "w");
    if (file == NULL) {
        printf("Failed to create the file.\n");
        return 1;
    }

    for (int i = 0; i < 4; i++) {
        fprintf(file, "%s\n", data[i]);
    }

    fclose(file);
    printf("Data has been written to payroll.txt\n");

    char filename[] = "payroll.txt";
    char line[SIZE];
    char name[SIZE], ssn[SIZE];
    float hourly, hours, gross;
    FILE *stream;

    stream = fopen(filename, "r");
    if (stream == NULL) {
        printf("Failed to open the file.\n");
        exit(1);
    }

    while (fgets(line, SIZE, stream) != NULL) {
        // Use sscanf to parse the line
        sscanf(line, "%49[^0-9] %49s %f %f", name, ssn, &hourly, &hours);
        gross = hours * hourly;
        printf(" Name: %s\t Social Security Number: %s\t Gross Pay: %.2f\n",name,ssn,gross);
    }

    fclose(stream);

    return 0;
}
