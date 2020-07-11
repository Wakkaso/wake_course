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
	int index_bit = (int)log2(cache_size / block_size);
	int line = cache_size >> (offset_bit);

	//cout << "offset_bit: " << offset_bit << endl;
	//cout << "index_bit: " << index_bit << endl;
	//cout << "line: " << line << endl;

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
		//cout << x << endl;
		index = (x >> offset_bit) & (line - 1);
		tag = x >> (index_bit + offset_bit);
		//cout << "index: " << index << endl;
		//cout << "tag: " << tag << endl;
		if (cache[index].v && cache[index].tag == tag) {
			cache[index].v = true;    // hit
			//cout << "hit" << endl;
		}
		else
		{
			cache[index].v = true;  // miss
			cache[index].tag = tag;
			//cout << "miss: " << x << endl;
			//cout << "miss" << endl;
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

	cout << endl << "DCACHE.txt" << endl << endl;
	cout << cache_size << "KB cache with 16B blocks " << endl;
	simulate(cache_size * K, 16);
	cout << cache_size << "KB cache with 32B blocks " << endl;
	simulate(cache_size * K, 32);
	cout << cache_size << "KB cache with 64B blocks " << endl;
	simulate(cache_size * K, 64);
	cout << cache_size << "KB cache with 128B blocks " << endl;
	simulate(cache_size * K, 128);
	cout << cache_size << "KB cache with 256B blocks " << endl;
	simulate(cache_size * K, 256);
	
}
