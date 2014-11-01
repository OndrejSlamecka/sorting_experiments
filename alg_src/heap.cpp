// Source: http://rosettacode.org/wiki/Sorting_algorithms/Heapsort#C.2B.2B 
#include <iostream>
#include <vector>
#include <algorithm> 

using namespace std;

void heap_sort(vector<int> &array) {
	auto begin = array.begin(),
		 end   = array.end();
	make_heap(begin, end);
	sort_heap(begin, end);
}

int main()
{
	vector<int> array;
	int n;
	while(cin >> n) array.push_back(n);

	clock_t start = clock();
	heap_sort(array);
	cout << (double)(clock() - start) / CLOCKS_PER_SEC << endl;
}

