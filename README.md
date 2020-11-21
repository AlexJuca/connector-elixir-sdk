# Connector

**An Elixir library for sending SMS's concurrently via Enterprise Connector**

![Elixir CI](https://github.com/AlexJuca/connector-elixir-sdk/workflows/Elixir%20CI/badge.svg)

This library allows you to use the power of elixir's processes and supervision trees 
to send SMS's efficiently. 

All message requests will be executed as an elixir Task which is part of a dynamic supervision tree. 
Each message request is attached to its own process, meaning you can send 
thousands of messages concurrently and efficiently.

## Usage
Send SMS 
```elixir
    message = "Hello, World"
    mobile = "+2449415955212"
    options = %{:api_key => System.get_env("EC_API_KEY")}
    Connector.send_sms(message, mobile, options)
```

## Usage
Get all SMS
```elixir
    options = %{:api_key => System.get_env("EC_API_KEY")}
    Connector.get_all_sms(options)
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

## Documentation
Visit [hex.docs](https://hexdocs.pm/connector/0.1.0) to see documentation.

## License

Copyright © 2020 Alexandre Juca <corextechnologies@gmail.com>

This work is free. You can redistribute it and/or modify it under the
terms of the MIT License. See the LICENSE file for more details.
