# PHP Extension to disable `eval`

Disables the `eval` language construct, since it can't be disabled via the `disabled_functions` INI setting.
I got tired of waiting for suhosin to be ready for PHP 7.0, especially with 7.1 around the corner, so I decided that since all I really need from it is to disable eval, I wrote an extension to do just that.

## Build instructions

1. `git clone https://github.com/lord2800/noeval`
2. `cd noeval`
3. `phpize`
4. `./configure`
5. `make`
6. `make install`

Works for PHP 5.6 and PHP 7, possibly more versions but I haven't explicitly tested it.
