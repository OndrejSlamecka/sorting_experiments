#include <iostream>
#include <vector>
#include <cstdlib>

using namespace std;

int compare_ints(const void* a, const void* b) {
	int arg1 = *reinterpret_cast<const int*>(a);
	int arg2 = *reinterpret_cast<const int*>(b);
	if(arg1 < arg2) return -1;
	if(arg1 > arg2) return 1;
	return 0;
}

int main() 
{
	vector<int> input;
	int n;
	while(cin >> n) input.push_back(n);

	int *a = &input[0];
	clock_t start = clock();

	qsort(a, input.size(), sizeof(int), compare_ints);

	cout << (double)(clock() - start) / CLOCKS_PER_SEC << endl;

	return 0;
}
