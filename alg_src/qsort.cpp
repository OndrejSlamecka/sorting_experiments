#include <iostream>
#include <vector>
#include <algorithm> // swap

#define uint unsigned int

using namespace std;

int partition(vector<int> &input, int l, int r) 
{
    int pivot = input[r];

    while (l < r) {
        while (input[l] < pivot)
            l++;

        while (input[r] > pivot)
            r--;

        if (input[l] == input[r]) {
            l++;
        } else if (l < r) {
            swap(input[l], input[r]);
        }
    }

    return r;
}

void quicksort(vector<int> &input, int l, int r)
{
    if (l < r) {
        int j = partition(input, l, r);        
        quicksort(input, l, j-1);
        quicksort(input, j+1, r);
    }
}

int main() 
{
	vector<int> input;
	int n;
    while(cin >> n) input.push_back(n);

	clock_t start = clock();

    quicksort(input, 0, input.size() - 1);

	cout << (double)(clock() - start) / CLOCKS_PER_SEC << endl;

    return 0;
}
