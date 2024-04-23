#include <stdio.h>  
#include <math.h>  
#include <stdlib.h>
  
// initializing 
int multiplier = 0, multiplicand = 0, auxcarry = 0, a1 = 0, b1 = 0;  
int multiplier_binary[5] = {0}, multiplicand_binary[5] = {0};  
int multiplier_binary_complement[5] = {0}, multiplicand_binary_complement[5] = {0};  
int multiplier_binary_copy[5] = {0}, comp2smaker[5] = { 1, 0, 0, 0, 0}, Accumulator[5] = {0}, res[5] = {0};

// Convert to binary
void binary(){  
    a1 = abs(multiplier);  
    b1 = abs(multiplicand);  

    // Basic conversion to binary
    int r1, r2; 
    for (int i = 0; i < 5; i++){  
        r1 = a1 % 2;  
        a1 = a1 / 2; 
        multiplier_binary[i] = r1;  
        multiplier_binary_copy[i] = r1;  // Copying the multiplier

        r2 = b1 % 2;  
        b1 = b1 / 2;  
        multiplicand_binary[i] = r2;  
        if(r2 == 0){  
            multiplicand_binary_complement[i] = 1;  
        }  
        if(r1 == 0){  
            multiplier_binary_complement[i] =1;  
        }  
    }  
    
    // Conversion from 1's complement to 2's complement by adding 1 to LSB
    auxcarry = 0;  
    for (int i = 0; i < 5; i++){  
        res[i] = comp2smaker[i]+ multiplicand_binary_complement[i] + auxcarry;  
        if(res[i] >= 2){  
            auxcarry = 1;  
        }  
        else  {
            auxcarry = 0;  
        }
        res[i] = res[i] % 2;  
    }  
    for (int i = 4; i >= 0; i--){  
        multiplicand_binary_complement[i] = res[i];  
    }  
  
    // In case multiplier is Negative
    if (multiplier < 0){  
        auxcarry = 0;  
        //resetting
        for (int i = 4; i >= 0; i--){  
            res[i] = 0;  
        }  
        for (int i = 0; i < 5; i++){  
            res[i] = comp2smaker[i] + multiplier_binary_complement[i] + auxcarry;  
            if (res[i] >= 2){  
                    auxcarry = 1;  
            }  
            else  
                    auxcarry = 0;  
            res[i] = res[i]%2;  
        }  
        for (int i = 4; i >= 0; i--){  
            multiplier_binary[i] = res[i];   // override previous
            multiplier_binary_copy[i] = res[i];  //saving a copy by overriding previous
        }  
    }  

    // In case multiplicand is negative    
    // Just interchange the complement and the normal one
   int temp;
   if(multiplicand < 0){  
     for (int i = 0; i < 5; i++){  
           temp = multiplicand_binary[i];  
           multiplicand_binary[i] = multiplicand_binary_complement[i];  
           multiplicand_binary_complement[i] = temp;  
     }  
   }  
}  


void add(int num[]){    
    auxcarry = 0;  
    for (int i = 0; i < 5; i++){  
        res[i] = Accumulator[i] + num[i] + auxcarry;  
        if (res[i] >= 2){  
            auxcarry = 1;  
        }  
        else{  
            auxcarry = 0;  
        }   
        res[i] = res[i]%2;  
    }  
    for (int i = 4; i >= 0; i--){  //transferring the results
        Accumulator[i] = res[i];  
        printf("%d",Accumulator[i]);  
    }  

    printf(":");  
    for (int i = 4; i >= 0; i--){  
        printf("%d", multiplier_binary_copy[i]);  
    }  
}  

void arshift(){  
    int MSB = Accumulator[4], LSB = Accumulator[0];  
    for (int i = 1; i < 5  ; i++){  
       Accumulator[i-1] = Accumulator[i];  
    }  
    Accumulator[4] = MSB;  // TO preserve the Sign Bit
    for (int i = 1; i < 5  ; i++){  
        multiplier_binary_copy[i-1] = multiplier_binary_copy[i];  
    }  
    multiplier_binary_copy[4] = LSB;  

    // For debugging
    printf("\nAR-SHIFT: ");  
    for (int i = 4; i >= 0; i--){  
        printf("%d",Accumulator[i]);  
    }  
    printf(":");  
    for(int i = 4; i >= 0; i--){  
        printf("%d", multiplier_binary_copy[i]);  
    }  
}  
  
void main(){  
    system("cls");
    printf("SAUGAT TAMANG [79010256]: \n\n");
    int Q = 0;  
    printf("\t\tBOOTH'S MULTIPLICATION ALGORITHM");  
    printf("\nEnter two numbers to multiply: ");  
    printf("\nBoth must be less than 16");  
    //simulating for two numbers each below 16  
    do {  
        printf("\nEnter A: ");  
        scanf("%d",&multiplier);  
        printf("Enter B: ");  
        scanf("%d", &multiplicand);  
    } while(multiplier >=16 || multiplicand >=16);  
    
    printf("\nExpected Product = %d", multiplier * multiplicand);  
    binary();  
    printf("\n\nBinary Equivalents are: ");  
    printf("\nA = ");  
    for (int i = 4; i >= 0; i--){  
        printf("%d", multiplier_binary[i]);  
    }  
    printf("\nB = ");  
    for (int i = 4; i >= 0; i--){  
        printf("%d", multiplicand_binary[i]);  
    }  
    printf("\nB'+ 1 = ");  
    for (int i = 4; i >= 0; i--){  
        printf("%d", multiplicand_binary_complement[i]);  
    }  
    printf("\n\n");  


    for (int i = 0;i < 5; i++){  
        // For 11 or 00 conditions
        if (multiplier_binary[i] == Q){  
            printf("\n-->");  
            arshift();  
            Q = multiplier_binary[i];  
        }  
        else if(multiplier_binary[i] == 1 && Q == 0){  
            printf("\n-->");  
            printf("\nSUB B: ");  
            add(multiplicand_binary_complement);  
            arshift();  
            Q = multiplier_binary[i];  
        }  
        else{  
            printf("\n-->");  
            printf("\nADD B: ");  
            add(multiplicand_binary);  
            arshift();  
            Q = multiplier_binary[i];  
        }  
    }  

    printf("\n\nProduct is = ");  
    for (int i = 4; i >= 0; i--){  
        printf("%d", Accumulator[i]);  
    }  
    for (int i = 4; i >= 0; i--){  
        printf("%d", multiplier_binary_copy[i]);  
    }  
}  