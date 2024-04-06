# SqliteDbTest

# Docker build fails

```
$  mix phx.gen.release --docker

$ docker build -t sqlite_db_test .
[+] Building 2.7s (16/28) docker:desktop-linux
=> [internal] load build definition from Dockerfile 0.0s
=> => transferring dockerfile: 2.77kB 0.0s
=> [internal] load metadata for docker.io/library/debian:bullseye-20240130-slim 1.9s
=> [internal] load metadata for docker.io/hexpm/elixir:1.15.7-erlang-26.2.2-debian-bullseye-20240130-slim 1.8s
=> [internal] load .dockerignore 0.0s
=> => transferring context: 1.31kB 0.0s
=> [builder 1/17] FROM docker.io/hexpm/elixir:1.15.7-erlang-26.2.2-debian-bullseye-20240130-slim@sha256:7786c0080470ad8bfc10dce44515415f3646a4b30361e4000e1692f7817ed549 0.0s
=> [internal] load build context 0.0s
=> => transferring context: 99.85kB 0.0s
=> [stage-1 1/6] FROM docker.io/library/debian:bullseye-20240130-slim@sha256:8481471cacd29779e7b6fe64a891f4b6771d8c3c7e57bb410542a3db10d1897a 0.0s
=> CACHED [stage-1 2/6] RUN apt-get update -y && apt-get install -y libstdc++6 openssl libncurses5 locales ca-certificates && apt-get clean && rm -f /var/lib/apt/lists/\*\** 0.0s
=> CACHED [stage-1 3/6] RUN sed -i '/en*US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen 0.0s
=> CACHED [stage-1 4/6] WORKDIR /app 0.0s
=> CACHED [stage-1 5/6] RUN chown nobody /app 0.0s
=> CACHED [builder 2/17] RUN apt-get update -y && apt-get install -y build-essential git && apt-get clean && rm -f /var/lib/apt/lists/*\_\* 0.0s
=> CACHED [builder 3/17] WORKDIR /app 0.0s
=> CACHED [builder 4/17] RUN mix local.hex --force && mix local.rebar --force 0.0s
=> [builder 5/17] COPY mix.exs mix.lock ./ 0.0s
=> ERROR [builder 6/17] RUN mix deps.get --only prod 1.1s

---

> [builder 6/17] RUN mix deps.get --only prod:
> 1.042
> 1.042 07:14:20.687 [notice] Application ssl exited: exited in: :ssl_app.start(:normal, [])
> 1.042 ** (EXIT) an exception was raised:
> 1.042 ** (ArgumentError) could not call Module.put_attribute/3 because the module SqliteDbTest.MixProject is already compiled
> 1.042 (elixir 1.15.7) lib/module.ex:2310: Module.assert_not_readonly!/2
> 1.042 (elixir 1.15.7) lib/module.ex:2007: Module.**put_attribute**/5
> 1.042 (ssl 11.1.1) ssl_app.erl:35: :ssl_app.stop/1
> 1.042 (kernel 9.2.1) application_master.erl:293: :application_master.start_it_old/4
> 1.042
> 1.042 07:14:20.695 [notice] Application public_key exited: :stopped
> 1.043
> 1.043 07:14:20.696 [notice] Application asn1 exited: :stopped
> 1.043
> 1.043 07:14:20.697 [notice] Application crypto exited: :stopped

> 1.045 Could not start Hex. Try fetching a new version with "mix local.hex" or uninstalling it with "mix archive.uninstall hex.ez"
> 1.053 \*\* (MatchError) no match of right hand side value: {:error, {:ssl, {:bad_return, {{:ssl_app, :start, [:normal, []]},
> {:EXIT, {%ArgumentError{message: "could not call Module.put_attribute/3 because the module SqliteDbTest.MixProject is already compiled"},
> [{Module, :assert_not_readonly!, 2, [file: ~c"lib/module.ex", line: 2310]},
> {Module, :__put_attribute__, 5, [file: ~c"lib/module.ex", line: 2007]},
> {:ssl_app, :stop, 1, [file: ~c"ssl_app.erl", line: 35]}, {:application_master, :start_it_old, 4, [file: ~c"application_master.erl", line: 293]}]}}}}}}

> 1.053 (hex 2.0.6) lib/hex.ex:5: Hex.start/0
> 1.053 (mix 1.15.7) lib/mix/hex.ex:60: Mix.Hex.start/0
> 1.053 (mix 1.15.7) lib/mix/dep/loader.ex:189: Mix.Dep.Loader.with_scm_and_app/5
> 1.053 (mix 1.15.7) lib/mix/dep/loader.ex:141: Mix.Dep.Loader.to_dep/4
> 1.053 (elixir 1.15.7) lib/enum.ex:1693: Enum."-map/2-lists^map/1-1-"/2
> 1.053 (mix 1.15.7) lib/mix/dep/loader.ex:364: Mix.Dep.Loader.mix_children/3
> 1.053 (mix 1.15.7) lib/mix/dep/loader.ex:18: Mix.Dep.Loader.children/1

## 1.053 (mix 1.15.7) lib/mix/dep/converger.ex:97: Mix.Dep.Converger.all/4

## Dockerfile:39

37 | # install mix dependencies
38 | COPY mix.exs mix.lock ./
39 | >>> RUN mix deps.get --only $MIX_ENV
40 | RUN mkdir config
41 |

---

ERROR: failed to solve: process "/bin/sh -c mix deps.get --only $MIX_ENV" did not complete successfully: exit code: 1
```
