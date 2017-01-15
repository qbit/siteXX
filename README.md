siteXX
======

Setup to produce a siteXX.tgz file for OpenBSD autoinstall.


Usage
-----

Once the `siteXX.tgz` file has been installed, `autoinstal(8)` can be
told to use it by adding the following to your install.conf:

```
Set name(s) = * site60.tgz
Checksum test for site60.tgz = yes
Continue without verification = yes
```

