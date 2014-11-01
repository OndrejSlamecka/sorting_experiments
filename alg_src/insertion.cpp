// Source: http://rosettacode.org/wiki/Sorting_algorithms/Insertion_sort#C.2B.2B
#include <iostream>
#include <vector>
#include <algorithm> 

using namespace std;

void insertion_sort(vector<int> &array) {
	auto begin = array.begin(),
		 end   = array.end();
	for (auto i = begin; i != end; ++i) {
		rotate(upper_bound(begin, i, *i, less<int>()), i, i + 1);
	}
}
 
int main()
{
	vector<int> array;
	int n;
	while(cin >> n) array.push_back(n);

	clock_t start = clock();
	insertion_sort(array);
	cout << (double)(clock() - start) / CLOCKS_PER_SEC << endl;
}

