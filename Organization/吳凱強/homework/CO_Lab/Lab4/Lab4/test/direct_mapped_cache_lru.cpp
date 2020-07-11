#include <iostream>
#include <stdio.h>
#include <math.h>

using namespace std;

#define way 1

struct cache_content
{
	bool v;
	unsigned int tag;
	int lru;
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
	int index_bit = (int)log2((cache_size / block_size) / way);
	int line = cache_size >> (offset_bit);

	float count = 0;
	float all = 0;

	int hit = 0;

	cache_content *cache = new cache_content[line];

	//cout << "cache line: " << line << endl;

	for (int j = 0; j < line; j++)
		cache[j].v = false;

	FILE *fp = fopen("LU.txt", "r");  // read file 

	while (fscanf(fp, "%x", &x) != EOF)
	{
		hit = 0;
		all++;
		//cout << hex << x << " ";
		index = (x >> offset_bit) & (line / way - 1);
		tag = x >> (index_bit + offset_bit);
		for (int i = 0; i < way; i++) {
			if (cache[index * way + i].v && cache[index * way + i].tag == tag) {
				cache[index * way + i].v = true;    // hit
				cache[index * way + i].lru = all;    // hit
				hit = 1;
				break;
				//cout << "hit" << endl;
			}
		}
		if (!hit) {
			int min = 100000;
			int index_for_min;
			for (int i = 0; i < way; i++) {
				if (cache[index * way + i].lru < min) {
					min = cache[index * way + i].lru;
					index_for_min = index * way + i;
				}
			}
			cache[index_for_min].v = true;
			cache[index_for_min].tag = tag;
			count++;
		}
	}
	fclose(fp);

	float missrate = count / all;
	//cout << count << " " << all << endl;
	cout << "Miss rate: " << missrate * 100 << "%" << endl;

	delete[] cache;
}

int main()
{
	int cache_size = 4;     // modify for simulate with different cahe size 

	// Let us simulate 4KB cache with 16B blocks
	cout << cache_size << "KB cache with 16B blocks " << endl;
	simulate(cache_size * K, 64);
	/*
	cout << cache_size << "KB cache with 32B blocks " << endl;
	simulate(cache_size * K, 32);
	cout << cache_size << "KB cache with 64B blocks " << endl;
	simulate(cache_size * K, 64);
	cout << cache_size << "KB cache with 128B blocks " << endl;
	simulate(cache_size * K, 128);
	cout << cache_size << "KB cache with 256B blocks " << endl;
	simulate(cache_size * K, 256);
	*/
}
