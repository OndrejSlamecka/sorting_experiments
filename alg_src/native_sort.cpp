#include <iostream>
#include <vector>
#include <algorithm> // sort

using namespace std;


int main() 
{
	vector<int> input;
	int n;
	while(cin >> n) input.push_back(n);

	clock_t start = clock();

	sort(input.begin(), input.end());

	cout << (double)(clock() - start) / CLOCKS_PER_SEC << endl;

	return 0;
}
