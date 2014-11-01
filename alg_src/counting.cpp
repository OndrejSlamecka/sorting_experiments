// Source: http://rosettacode.org/wiki/Sorting_algorithms/Counting_sort#C.2B.2B
#include <iostream>
#include <vector>
#include <algorithm> // minmax_element

using namespace std;

void counting_sort(vector<int> &array) {
	auto begin = array.begin(),
		 end   = array.end();

	auto min_max = std::minmax_element(begin, end);
	if (min_max.first == min_max.second) {  // empty range
		return;
	}
	auto min = *min_max.first;
	auto max = *min_max.second;
	std::vector<unsigned> count((max - min) + 1, 0u);
	for (auto i = begin; i != end; ++i) {
		++count[*i - min];
	}
	for (auto i = min; i <= max; ++i) {
		for (auto j = 0; j < count[i - min]; ++j) {
			*begin++ = i;
		}
	}
}

int main()
{
	vector<int> array;
	int n;
	while(cin >> n) array.push_back(n);

	clock_t start = clock();
	counting_sort(array);
	cout << (double)(clock() - start) / CLOCKS_PER_SEC << endl;
}

