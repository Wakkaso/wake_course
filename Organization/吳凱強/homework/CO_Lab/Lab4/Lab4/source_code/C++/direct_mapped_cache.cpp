#include <iostream>
#include <stdio.h>
#include <math.h>

using namespace std;

struct cache_content
{
	bool v;
	unsigned int tag;
	// unsigned int	data[16];
};

const int K = 1024;

double log2(double n)
{
	// log(n) / log(2) is log2.
	return log(n) / log(double(2));
}


void simulate(int cache_size, int block_size)
{
	unsigned int tag, index, x;

	int offset_bit = (int)log2(block_size);
	// cout<<"offset: "<<offset_bit<<"\n";
	int index_bit = (int)log2(cache_size / block_size);
	// cout<<"index: "<<index_bit<<"\n";
	int line = cache_size >> (offset_bit);

	float count = 0;
	float all = 0;

	cache_content *cache = new cache_content[line];

	//cout << "cache line: " << line << endl;

	for (int j = 0; j < line; j++)
		cache[j].v = false;

	FILE *fp = fopen("DCACHE.txt", "r");  // read file 

	while (fscanf(fp, "%x", &x) != EOF)
	{
		all++;
		//cout << hex << x << " ";
		index = (x >> offset_bit) & (line - 1);
		// cout<<"index:"<<index<<"\n";
		tag = x >> (index_bit + offset_bit);
			//cout<<"tag:"<<tag<<"\n";
		if (cache[index].v && cache[index].tag == tag) {
			cache[index].v = true;    // hit
			//cout << "hit" << endl;
		}
		else
		{
			cache[index].v = true;  // miss
			cache[index].tag = tag;
			//cout << "miss" << endl;
			//cout<<"x: "<<x<<"\n";
			count++;
		}
	}
	fclose(fp);
	//cout<<"count: "<<count<<"\n";
	//cout<<"all: "<<all<<"\n";

	float missrate = count / all;
	//cout << count << " " << all << endl;
	cout << "Miss rate: " << missrate * 100 << "%" << endl;

	delete[] cache;
}

int main()
{
	int cache_size[4] = {4, 16, 64, 256};     // modify for simulate with different cahe size 
	
	// Let us simulate 4KB cache with 16B blocks
	for (int i = 0; i < 4; i++)
	{
		cout << cache_size[i] << "KB cache with 16B blocks " << endl;
		simulate(cache_size[i] * K, 16);
		cout << cache_size[i] << "KB cache with 32B blocks " << endl;
		simulate(cache_size[i] * K, 32);
		cout << cache_size[i] << "KB cache with 64B blocks " << endl;
		simulate(cache_size[i] * K, 64);
		cout << cache_size[i] << "KB cache with 128B blocks " << endl;
		simulate(cache_size[i] * K, 128);
		cout << cache_size[i] << "KB cache with 256B blocks " << endl;
		simulate(cache_size[i] * K, 256);
		cout<<"--------------------------------\n";
	}
	
	
}
