// Author: Matus Kralik
#include <iostream>
#include <ctime>
#include <vector>

using namespace std;

int main()
{
	vector<int> array;	
	int n; 
	while(cin >> n) array.push_back(n);

	int size = array.size();
	clock_t start = clock();

	bool switched = false;
	for(int i = 0; i < size - 1; i++) {
		for(int j = 0; j < size - i - 1; j++) {
			if(array[j+1] < array[j]) {
				switched = true;
				int tmp = array[j + 1];
				array[j + 1] = array[j];
				array[j] = tmp;
			}
		}

		if (!switched)
			break;

		switched = false;
	}

	
	cout << (double)(clock() - start) / CLOCKS_PER_SEC;
	return 0;
}
