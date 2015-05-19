htpasswd2 Cookbook
========================

[![Build Status](https://travis-ci.org/vkhatri/chef-htpasswd2.svg?branch=master)](https://travis-ci.org/vkhatri/chef-htpasswd2)

This is a [Chef] cookbook to manage htpasswd file using LWRP.

This cookbook expects the password in hash format to keep it simple and secure.

## How to Generate User Password

To generate a password hash, below openssl command can be used.

```
printf "`openssl passwd -apr1`\n"
```

## LWRP

### LWRP file

### LWRP user

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[Contributors]: https://github.com/vkhatri/chef-htpasswd2/graphs/contributors
