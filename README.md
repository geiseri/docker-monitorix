monitorix in docker
===================

Two ways to run, with *--net host* or without.

```docker run -d -p 8080:8080 geiseri/monitorix```

```docker run -d --net host geiser/monitorix```

Provide additional configuration:
```docker run -d -p 8080:8080 -v $PWD/support:/etc/monitorix/conf.d geiseri/monitorix```

Access host libvirt:
```docker run -d -p 8080:8080 -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock -v $PWD/support:/etc/monitorix/conf.d geiseri/monitorix```

Read SMART values from disks:
```docker run -d -p 8080:8080 --privileged=true -v $PWD/support:/etc/monitorix/conf.d geiseri/monitorix```

Read metrics from ethernet:
```docker run -d --net host -v $PWD/support:/etc/monitorix/conf.d geiseri/monitorix```



