# chained
Broken example of chained catalyst pages

Originally:

[debug] Loaded Path actions:
.-----------------------+-----------------------.
| Path                  | Private               |
+-----------------------+-----------------------+
| /                     | /index                |
| /...                  | /chained_root         |
| /...                  | /default              |
| /about/               | /about                |
'-----------------------+-----------------------'

By changing the definition of default we can get:

[debug] Loaded Path actions:
.-----------------------+-----------------------.
| Path                  | Private               |
+-----------------------+-----------------------+
| /                     | /index                |
| /...                  | /chained_root         |
| /about/               | /about                |
'-----------------------+-----------------------'

[debug] Loaded Chained actions:
.-----------------------+-----------------------.
| Path Spec             | Private               |
+-----------------------+-----------------------+
| /...                  | /default (...)        |
'-----------------------+-----------------------'


