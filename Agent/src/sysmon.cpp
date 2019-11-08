#include <iostream>
#include <boost/asio.hpp>
#include <boost/date_time/posix_time/posix_time.hpp>
using namespace std;
using namespace boost::asio;

int main() {
	io_service io;
	deadline_timer t(io, boost::posix_time::seconds(5));
	t.wait();

	cout << "Hello, World" << endl;

	return 0;
}