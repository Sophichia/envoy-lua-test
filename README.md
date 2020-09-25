## Envoy luasocket test

Note that this is not recommended, since `luasocket` is blocking.

## Build and run

```bash
$ make
$ make run

// From another terminal session
$ curl localhost:8000
{"args":{},"headers":{"x-forwarded-proto":"https","x-forwarded-port":"443","host":"localhost","x-amzn-trace-id":"Root=1-5f6d39ed-75c8f0de990ca942e91ab258","content-length":"0","user-agent":"curl/7.58.0","accept":"*/*","x-request-id":"a3f82815-15cb-42cd-b4bd-57026c10443a","foo":"LuaSocket 3.0-rc1","x-envoy-expected-rq-timeout-ms":"15000","x-envoy-original-path":"/"},"url":"https://localhost/get"}
```

From the response, you can see that `"foo":"LuaSocket 3.0-rc1"` is set by Lua script.
