#include <iostream>
#include <stdio.h>
#include <math.h>
using namespace std;

int **A, **B, **C;

struct cache_content1
{
    bool v;
    unsigned int tag;
    unsigned int counter;
    unsigned int content;
    // unsigned int    data[16];
};

void sim(int Abase, int Bbase, int Cbase, int m, int n, int p){
    unsigned int tag, index, x;
    int cache_size = 512;
    int block_size = 32;
    int set_size = 8;
    int offset_bit = (int)log2(block_size);
    int index_bit = (int)log2(cache_size / block_size / set_size);
    
    int block = cache_size >> (offset_bit);
    
    int set_number = block / set_size;
    cache_content1 **cache = new cache_content1*[set_number];
    for (int i = 0 ; i < set_number ; i++) {
        cache[i] = new cache_content1[set_size];
    }
}



int main()
{
    FILE *fp = fopen("a1xb1", "r");  // read file
    unsigned int Abase, Bbase, Cbase;
    unsigned int m, n, p;

    fscanf(fp, "%x", &Abase);
    fscanf(fp, "%x", &Bbase);
    fscanf(fp, "%x", &Cbase);
    fscanf(fp, "%d", &m);
    fscanf(fp, "%d", &n);
    fscanf(fp, "%d", &p);
    
    A = new int*[m];
    B = new int*[n];
    C = new int*[m];
    
    for(int i = 0 ; i < m ; i++) //initialize A
        A[i] = new int[n];
    for(int i = 0 ; i < n ; i++) //initialize B
        B[i] = new int[p];
    for(int i = 0 ; i < m ; i++) //initialize C
        C[i] = new int[p];
        
    unsigned int program_cycle = 2 + m * (3 + p * (3 + n * (20 + 2) + 2 + 2) + 2 + 2) + 2 + 1;
    
    for(int i = 0 ; i < m ; i++){
        for(int j = 0 ; j < n ; j++){
            fscanf(fp, "%d", &A[i][j]);
        }
    }
    for(int i = 0 ; i < n ; i++){
        for(int j = 0 ; j < p ; j++){
            fscanf(fp, "%d", &B[i][j]);
        }
    }

    cout<<program_cycle<<endl;
    
    
    
    delete [] A;
    delete [] B;
    delete [] C;
}


