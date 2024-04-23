#include <stdio.h>
#include <math.h>
#include <string.h>

// Function to convert binary to decimal
int binaryToDecimal(char binary[]) {
    int decimal = 0;
    int length = strlen(binary);
    
    for (int i = 0; i < length; i++) {
        if (binary[i] == '1') {
            decimal += pow(2, length - 1 - i);
        }
    }
    
    return decimal;
}

// Function to convert binary to octal
void binaryToOctal(char binary[]) {
    char octal[100];
    int decimal = binaryToDecimal(binary);
    sprintf(octal, "%o", decimal);
    
    printf("-> Octal representation: %s\n", octal);
}

// Function to convert binary to hexadecimal
void binaryToHexadecimal(char binary[]) {
    char hexadecimal[100];
    int decimal = binaryToDecimal(binary);
    sprintf(hexadecimal, "%X", decimal);
    
    printf("-> Hexadecimal representation: %s\n", hexadecimal);
}

int main() {
    system("cls");
    printf("SAUGAT TAMANG [79010256]: \n\n");
    char binary[100];
    
    // Input binary number from user
    printf("Enter a binary number: ");
    scanf("%s", binary);
    
    // Convert binary to decimal
    printf("-> Decimal representation: %d\n", binaryToDecimal(binary));
    
    // Convert binary to octal
    binaryToOctal(binary);
    
    // Convert binary to hexadecimal
    binaryToHexadecimal(binary);
    
    return 0;
}
