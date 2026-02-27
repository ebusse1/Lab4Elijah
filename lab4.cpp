#include <iostream>
#include <cstdio>

using namespace std; 

extern "C" void find_sum(const int * data_array, int count); // Assembly function

int main(){

    //Create array to hold the integers
    int data_array[100];
    int size = 0;
    int count = 0;

    //Open the file
    FILE * my_file = fopen("data.txt", "r");

    fscanf(my_file, "%d", &size); // Load the first number into size


    //Count the ints in the file, and load them in
     while (fscanf(my_file, "%d", &data_array[count]) == 1 && count < size) {
        count++;
    }

    find_sum(data_array, count);
    
    return 0;
}