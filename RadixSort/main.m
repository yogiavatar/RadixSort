//  Function to find the highest 4 numbers in an unordered list of integers
//  in O(n) time. 
//
//  main.m
//  
//  Created by Rashmi Bajaj on 1/4/13.
//

#import <Foundation/Foundation.h>
// define the maximum size of the array of integers
#define MAXVAL 6
#define SHOWPASS 

void print(int *a, int n);
void printTop4(int *a, int n);
void radixSort(int *a, int n);

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        int arr[MAXVAL];
        int i, n;
        
        printf("Enter total elements (n < %d) : ", MAXVAL);
        scanf("%d", &n);
        
        printf("Enter %d Elements : ", n);
        for (i = 0; i < n; i++)
            scanf("%d", &arr[i]);
        
        
        printf("\nARRAY  : ");
        print(&arr[0], n);
        
        radixSort(&arr[0], n);
        
        printf("\nTOP 4 ELEMENTS : ");
        printTop4(&arr[0], n);
        printf("\n");
        
    }
    return 0;
}


void print(int *a, int n)
{
    int i;
    for (i = 0; i < n; i++)
        printf("%d\t", a[i]);
}

//function to print the top 4 elements of the sorted array
void printTop4(int *a, int n)
{
    int i;
    for (i = n-1; i > n-5; i--)
        printf("%d\t", a[i]);
}

//LSD radix sort algorithm to sort integers
void radixSort(int *a, int n)
{
    int i, b[MAXVAL], m = a[0], exp = 1;
    for (i = 0; i < n; i++)
    {
        if (a[i] > m)
            m = a[i];
    }
    
    while (m / exp > 0)
    {
        int bucket[10] = { 0 };
        
        for (i = 0; i < n; i++)
            bucket[a[i] / exp % 10]++;
        
        for (i = 1; i < 10; i++)
            bucket[i] += bucket[i - 1];
        
        for (i = n - 1; i >= 0; i--)
            b[--bucket[a[i] / exp % 10]] = a[i];
        
        for (i = 0; i < n; i++)
            a[i] = b[i];
        
        exp *= 10;
        
#ifdef SHOWPASS
        printf("\nPASS   : ");
        print(a, n);
#endif
    }
}

