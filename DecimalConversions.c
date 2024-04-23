#include <stdio.h>
#include <stdlib.h>

// Function to convert decimal to binary
void decimalToBinary(int n) {
    // Array to store binary number
    int binaryNum[32];

    // Counter for binary array
    int i = 0;
    while (n > 0) {
        // Store the remainder in binary array
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Print the binary array in reverse order
    printf("-> Binary representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

// Function to convert decimal to octal
void decimalToOctal(int n) {
    // Array to store octal number
    int octalNum[100];
    
    // Counter for octal array
    int i = 0;
    while (n != 0) {
        // Store the remainder in octal array
        octalNum[i] = n % 8;
        n = n / 8;
        i++;
    }

    // Print the octal array in reverse order
    printf("-> Octal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", octalNum[j]);
    }
    printf("\n");
}

// Function to convert decimal to hexadecimal
void decimalToHexadecimal(int n) {
    // Array to store hexadecimal number
    char hexadecimalNum[100];
    
    // Counter for hexadecimal array
    int i = 0;
    while (n != 0) {
        // Get the remainder when divided by 16
        int remainder = n % 16;

        // Convert remainder to hexadecimal
        if (remainder < 10)
            hexadecimalNum[i] = remainder + '0'; // For 0-9
        else
            hexadecimalNum[i] = remainder + 'A'-10; // For A-F

        n = n / 16;
        i++;
    }

    // Print the hexadecimal array in reverse order
    printf("-> Hexadecimal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexadecimalNum[j]);
    }
    printf("\n");
}

int main() {
    system("cls");
    printf("SAUGAT TAMANG [79010256]: \n\n");
    int decimalNumber;
    // Input decimal number from user
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call functions to convert decimal to binary, octal, and hexadecimal
    decimalToBinary(decimalNumber);
    decimalToOctal(decimalNumber);
    decimalToHexadecimal(decimalNumber);

    return 0;
}
