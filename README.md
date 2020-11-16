# Connector

**A simple Elixir library for sending SMS's via Enterprise Connector**

![Elixir CI](https://github.com/AlexJuca/connector-elixir-sdk/workflows/Elixir%20CI/badge.svg)

## Usage

```elixir
    message = "Hello, World"
    mobile = "+2449415955212"
    options = %{:api_key => System.get_env("EC_API_KEY")}
    Connector.send_sms(message, mobile, options)
```

## Installation

Add `connector` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:connector, "~> 0.1.0"}
  ]
end
```

## License

Copyright © 2020 Alexandre Juca <corextechnologies@gmail.com>

This work is free. You can redistribute it and/or modify it under the
terms of the MIT License. See the LICENSE file for more details.
