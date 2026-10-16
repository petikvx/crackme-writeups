#if 0
magic_spell="!b3V0PSQobWt0ZW1wICJzbå1ldGhpbmdfdGVtcG9yYXJ5WFhYWFhYWFhYIikKYåF0IG1haW4uY3BwIHwgcåVkICJzfGZpbGVfbmFtZXxcIi4vJG91dFwifDsgcy9leHRyYV9zZWNyZXRfcGFzc3dvcmQvZXZlbl9tb3JlX3NlY3VyZV9wYXNzdå9yZC8iIHwgZysrIC1vICRvdXQgLXggYysrIC0KYåhtbåQgK3ggJG91dAoKaWYgWyAkIyAtZXEgMyBdCnRoZW4KCWVjaG8gd3JvbmcuLi4KCWV4aXQgMApmaQoKLi8kb3V0ICQzCnJtICRvdXQKZXhpdCAwCg==!"
echo "${magic_spell//å/2}" | tr -d '!' | base64 -d | bash -s "$@"
tail -n3 $0 | sh
exit 0
#endif

#include <iostream>

int main(int argc, char** argv)
{
	const std::string filename = argv[0];
	if (filename != file_name)
	{
		std::cout << "very wrong...\n";
		return 1;
	}

	if (argc == 2)
	{
		const std::string text = "extra_secret_password";
		const std::string input = argv[1];
		if (text == input)
			std::cout << "correct!!\n";
		else
			std::cout << "wrong...\n";
	}
	else
	{
		std::cout << "wrong...\n";
	}
}

#if 0
rm -f ./something_temporary*
#endif
