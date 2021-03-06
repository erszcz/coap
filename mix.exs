defmodule Coap.Mixfile do
  use Mix.Project

  def project do
    [app: :coap,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    []
  end

  defp deps do
    [
      {:gen_coap, git: "https://github.com/erszcz/gen_coap.git", ref: "d25cb4c"},
      {:apex, "~> 1.0.0"}
    ]
  end
end
