A very simple lib to return dependencies based on their order appearance. An
exercise in string manipulation if you will.

For example, given the input:

```
rails activerecord
mysql socket
activerecord mysql
rails activesupport
activerecord yaml
```

You will get the output:

```
"socket activesupport yaml mysql activerecord rails"
```
Where the items from the right depend items from left, i.e rails depends on
activerecord, activerecord depends on mysql, yaml depends on activesupport, and
socket has no dependencies.
